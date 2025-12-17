package com.by.devtool.coor;

/**
 * @author bandd
 * @date2025年12月17日10:20
 */
import org.locationtech.proj4j.*;

public class CGCS2000Transformer2 {

    // 35带中央经线 = 35*3 - 105 = 105°
    private static final String CGCS2000_35N = "+proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs";


    // 36带中央经线 = 36*3 - 105 = 108°
    private static final String CGCS2000_36N = "+proj=tmerc +lat_0=0 +lon_0=108 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs";

    private CRSFactory crsFactory = new CRSFactory();
    private CoordinateTransformFactory ctFactory = new CoordinateTransformFactory();

    /**
     * CGCS2000 35带投影坐标转地理坐标
     * @param y 北坐标（正常值，如：2948492.000）
     * @param x 东坐标（带带号，如：35620127.000）
     * @return [经度, 纬度]
     */
    public double[] transform35NToGeographic(double y, double x) {
        try {
            CoordinateReferenceSystem sourceCRS = crsFactory.createFromParameters("CGCS2000_35N", CGCS2000_35N);
            CoordinateReferenceSystem targetCRS = crsFactory.createFromParameters("WGS84",
                    "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs");

            CoordinateTransform transform = ctFactory.createTransform(sourceCRS, targetCRS);

            // 去掉35带号：35620127 -> 620127
            double easting = x - 35000000;

            ProjCoordinate srcCoord = new ProjCoordinate(easting, y);
            ProjCoordinate tgtCoord = new ProjCoordinate();

            transform.transform(srcCoord, tgtCoord);

            return new double[]{tgtCoord.x, tgtCoord.y};

        } catch (Exception e) {
            throw new RuntimeException("35带坐标转换失败", e);
        }
    }

    /**
     * CGCS2000 36带投影坐标转地理坐标
     * @param y 北坐标（正常值，如：2948492.000）
     * @param x 东坐标（带带号，如：36620127.000）
     * @return [经度, 纬度]
     */
    public double[] transform36NToGeographic(double y, double x) {
        try {
            CoordinateReferenceSystem sourceCRS = crsFactory.createFromParameters("CGCS2000_36N", CGCS2000_36N);
            CoordinateReferenceSystem targetCRS = crsFactory.createFromParameters("WGS84",
                    "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs");

            CoordinateTransform transform = ctFactory.createTransform(sourceCRS, targetCRS);

            // 去掉36带号：36620127 -> 620127
            double easting = x - 36000000;

            ProjCoordinate srcCoord = new ProjCoordinate(easting, y);
            ProjCoordinate tgtCoord = new ProjCoordinate();

            transform.transform(srcCoord, tgtCoord);

            return new double[]{tgtCoord.x, tgtCoord.y};

        } catch (Exception e) {
            throw new RuntimeException("36带坐标转换失败", e);
        }
    }

    /**
     * 自动判断带号并进行转换（通用方法）
     * @param y 北坐标
     * @param x 带带号的东坐标
     * @return [经度, 纬度]
     */
    public double[] transformToGeographic(double y, double x) {
        // 提取带号（前2位）
        int zone = (int) (x / 1000000);

        if (zone == 35) {
            return transform35NToGeographic(y, x);
        } else if (zone == 36) {
            return transform36NToGeographic(y, x);
        } else {
            throw new IllegalArgumentException("不支持的带号：" + zone + "，仅支持35带和36带");
        }
    }

    /**
     * 地理坐标转35带投影坐标
     * @param lon 经度
     * @param lat 纬度
     * @return [北坐标, 带带号的东坐标]
     */
    public double[] transformGeographicTo35N(double lon, double lat) {
        try {
            CoordinateReferenceSystem sourceCRS = crsFactory.createFromParameters("WGS84",
                    "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs");
            CoordinateReferenceSystem targetCRS = crsFactory.createFromParameters("CGCS2000_35N", CGCS2000_35N);

            CoordinateTransform transform = ctFactory.createTransform(sourceCRS, targetCRS);

            ProjCoordinate srcCoord = new ProjCoordinate(lon, lat);
            ProjCoordinate tgtCoord = new ProjCoordinate();

            transform.transform(srcCoord, tgtCoord);

            // 添加带号：620127 -> 35620127
            double easting = tgtCoord.x + 35000000;

            return new double[]{tgtCoord.y, easting};

        } catch (Exception e) {
            throw new RuntimeException("地理坐标转35带投影坐标失败", e);
        }
    }

    /**
     * 地理坐标转36带投影坐标
     * @param lon 经度
     * @param lat 纬度
     * @return [北坐标, 带带号的东坐标]
     */
    public double[] transformGeographicTo36N(double lon, double lat) {
        try {
            CoordinateReferenceSystem sourceCRS = crsFactory.createFromParameters("WGS84",
                    "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs");
            CoordinateReferenceSystem targetCRS = crsFactory.createFromParameters("CGCS2000_36N", CGCS2000_36N);

            CoordinateTransform transform = ctFactory.createTransform(sourceCRS, targetCRS);

            ProjCoordinate srcCoord = new ProjCoordinate(lon, lat);
            ProjCoordinate tgtCoord = new ProjCoordinate();

            transform.transform(srcCoord, tgtCoord);

            // 添加带号：620127 -> 36620127
            double easting = tgtCoord.x + 36000000;

            return new double[]{tgtCoord.y, easting};

        } catch (Exception e) {
            throw new RuntimeException("地理坐标转36带投影坐标失败", e);
        }
    }

    /**
     * 根据经度自动选择带号进行投影转换
     * @param lon 经度
     * @param lat 纬度
     * @return [北坐标, 带带号的东坐标]
     */
    public double[] transformGeographicToZone(double lon, double lat) {
        // 计算带号：zone = floor((lon + 1.5) / 3) + 1
        int zone = (int) Math.floor((lon + 1.5) / 3);

        if (zone == 35) {
            return transformGeographicTo35N(lon, lat);
        } else if (zone == 36) {
            return transformGeographicTo36N(lon, lat);
        } else {
            // 如果经度不在35或36带范围内，可以抛出异常或使用最近带
            throw new IllegalArgumentException("经度" + lon + "不在35带或36带范围内");
        }
    }

    public static void main(String[] args) {
        CGCS2000Transformer2 transformer = new CGCS2000Transformer2();

        System.out.println("=== 35带坐标转换 ===");
        // 示例1: 35带坐标转地理坐标
        double[] geo35 = transformer.transform35NToGeographic(2948300.453, 35619805.464);
        System.out.printf("35带转地理坐标: 经度=%.9f, 纬度=%.9f%n", geo35[0], geo35[1]);

        // 测试反转换
        double[] proj35 = transformer.transformGeographicTo35N(geo35[0], geo35[1]);
        System.out.printf("地理坐标转35带: 北坐标=%.3f, 东坐标=%.3f%n", proj35[0], proj35[1]);

        System.out.println("\n=== 36带坐标转换 ===");
        // 示例2: 36带坐标转地理坐标
        double[] geo36 = transformer.transform36NToGeographic(2948300.453, 36619805.464);
        System.out.printf("36带转地理坐标: 经度=%.9f, 纬度=%.9f%n", geo36[0], geo36[1]);

        // 测试反转换
        double[] proj36 = transformer.transformGeographicTo36N(geo36[0], geo36[1]);
        System.out.printf("地理坐标转36带: 北坐标=%.3f, 东坐标=%.3f%n", proj36[0], proj36[1]);

        System.out.println("\n=== 通用方法测试 ===");
        // 使用通用方法
        double[] geoAuto35 = transformer.transformToGeographic(2948300.453, 35619805.464);
        System.out.printf("通用方法35带转地理坐标: 经度=%.9f, 纬度=%.9f%n", geoAuto35[0], geoAuto35[1]);

        double[] geoAuto36 = transformer.transformToGeographic(2948300.453, 36619805.464);
        System.out.printf("通用方法36带转地理坐标: 经度=%.9f, 纬度=%.9f%n", geoAuto36[0], geoAuto36[1]);

        // 根据经度自动选择带号
        double[] projAuto = transformer.transformToGeographic(2948492.00000000000, 35620127.00000000000);
        System.out.printf("地理坐标自动选择带号: 北坐标=%.9f, 东坐标=%.9f%n", projAuto[0], projAuto[1]);
    }
}