package com.by.lesson02.controller;

import com.by.common.utils.CaptchaUtil;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpSession;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * @author bandd
 * @date2026年01月29日11:05
 */
@Controller
@Tag(name = "图片验证", description = "图片验证")
public class CaptchaController {

    private final RedisTemplate<String, Object> redisTemplate;

    public CaptchaController(RedisTemplate<String, Object> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    @Operation(summary = "生成验证码", description = "/")
    @GetMapping("/captcha")
    public String index(Model model, HttpSession session) {
        // 生成验证码
        String code = CaptchaUtil.generateCode();
        String captchaKey = UUID.randomUUID().toString();
        // 存储到Redis，过期时间1分钟
        redisTemplate.opsForValue().set("captcha:" + captchaKey, code, 1, TimeUnit.MINUTES);
        // 生成验证码图片
        String captchaImage = CaptchaUtil.generateCaptchaImage(code);
        // 存储key到session
        session.setAttribute("captchaKey", captchaKey);
        // 传递到前端
        model.addAttribute("captchaImage", captchaImage);
        return "index";
    }

    @Operation(summary = "刷新验证码", description = "refresh")
    @PostMapping("/refresh")
    @ResponseBody
    public String refreshCaptcha(HttpSession session) {
        // 生成新的验证码
        String code = CaptchaUtil.generateCode();
        String captchaKey = UUID.randomUUID().toString();
        // 存储到Redis，过期时间1分钟
        redisTemplate.opsForValue().set("captcha:" + captchaKey, code, 1, TimeUnit.MINUTES);
        // 生成验证码图片
        String captchaImage = CaptchaUtil.generateCaptchaImage(code);
        // 更新session中的key
        session.setAttribute("captchaKey", captchaKey);
        return captchaImage;
    }

    @Operation(summary = "验证验证码", description = "refresh")
    @PostMapping("/verify")
    @ResponseBody
    public String verifyCaptcha(@RequestParam("code") String code, HttpSession session) {
        String captchaKey = (String) session.getAttribute("captchaKey");
        if (captchaKey == null) {
            return "验证码已过期，请刷新";
        }
        // 从Redis获取验证码
        String storedCode = (String) redisTemplate.opsForValue().get("captcha:" + captchaKey);
        if (storedCode == null) {
            return "验证码已过期，请刷新";
        }
        if (storedCode.equalsIgnoreCase(code)) {
            // 验证成功后删除验证码
            redisTemplate.delete("captcha:" + captchaKey);
            return "验证成功";
        } else {
            return "验证码错误，请重新输入";
        }
    }

}
