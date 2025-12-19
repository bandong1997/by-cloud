package com.by.devtool.coor.encap;

/**
 * @author bandd
 * @date2025年12月17日10:20
 */
import org.locationtech.proj4j.*;


public class CGCS2000Transformer {

    private static CRSFactory crsFactory = new CRSFactory();
    private static CoordinateTransformFactory ctFactory = new CoordinateTransformFactory();

    /**
     * 自动判断带号并进行转换（通用方法）
     * @param x 带带号的东坐标
     * @param y 北坐标
     * @return [经度, 纬度]
     */
    public static double[] transformToGeographic(double x, double y) {
        // 提取带号（前2位）
        int zone = (int) (x / 1000000);
        CoordinateReferenceSystem targetCRS = crsFactory.createFromParameters("EPSG:4490", CRSConstants.MB);
        if (zone == 35) {
            return transform35NToGeographic(targetCRS, x, y);
        } else if (zone == 36) {
            return transform36NToGeographic(targetCRS, x, y);
        } else {
            throw new IllegalArgumentException("不支持的带号：" + zone + "，仅支持35带和36带");
        }
    }

    /**
     * CGCS2000 35带投影坐标转地理坐标
     * @param x 东坐标（带带号，如：35620127.000）
     * @param y 北坐标（正常值，如：2948492.000）
     * @return [经度, 纬度]
     */
    public static double[] transform35NToGeographic(CoordinateReferenceSystem targetCRS, double x, double y) {
        try {
            CoordinateReferenceSystem sourceCRS = crsFactory.createFromParameters("CGCS2000_35N", CRSConstants.CGCS2000_35N);

            return transform(sourceCRS, targetCRS, x, y);
        } catch (Exception e) {
            throw new RuntimeException("35带坐标转换失败", e);
        }
    }

    /**
     * CGCS2000 36带投影坐标转地理坐标
     * @param x 东坐标（带带号，如：36620127.000）
     * @param y 北坐标（正常值，如：2948492.000）
     * @return [经度, 纬度]
     */
    public static double[] transform36NToGeographic(CoordinateReferenceSystem targetCRS, double x, double y) {
        try {
            CoordinateReferenceSystem sourceCRS = crsFactory.createFromParameters("EPSG:CGCS2000_36N", CRSConstants.CGCS2000_36N);
            return transform(sourceCRS, targetCRS, x, y);
        } catch (Exception e) {
            throw new RuntimeException("36带坐标转换失败", e);
        }
    }

    /**
     * 公用处理方式
     */
    public static double[] transform(CoordinateReferenceSystem sourceCRS, CoordinateReferenceSystem targetCRS, double x, double y){
        CoordinateTransform transform = ctFactory.createTransform(sourceCRS, targetCRS);
        ProjCoordinate srcCoord = new ProjCoordinate(x, y);
        ProjCoordinate tgtCoord = new ProjCoordinate();
        transform.transform(srcCoord, tgtCoord);
        return new double[]{tgtCoord.x, tgtCoord.y};
    }


    /**
     * 地理坐标转35带投影坐标
     * @param x 经度
     * @param y 纬度
     * @return [北坐标, 带带号的东坐标]
     */
    public static double[] transformGeographicTo35N(double x, double y) {
        try {
            CoordinateReferenceSystem sourceCRS = crsFactory.createFromParameters("EPSG:4490", CRSConstants.MB);
            CoordinateReferenceSystem targetCRS = crsFactory.createFromParameters("CGCS2000_35N", CRSConstants.CGCS2000_35N);
            return transform(sourceCRS, targetCRS, x, y);
        } catch (Exception e) {
            throw new RuntimeException("地理坐标转35带投影坐标失败", e);
        }
    }

    /**
     * 地理坐标转36带投影坐标
     * @param x 经度
     * @param y 纬度
     * @return [北坐标, 带带号的东坐标]
     */
    public double[] transformGeographicTo36N(double x, double y) {
        try {
            CoordinateReferenceSystem sourceCRS = crsFactory.createFromParameters("EPSG:4490", CRSConstants.MB);
            CoordinateReferenceSystem targetCRS = crsFactory.createFromParameters("CGCS2000_36N", CRSConstants.CGCS2000_36N);
            return transform(sourceCRS, targetCRS, x, y);

        } catch (Exception e) {
            throw new RuntimeException("地理坐标转36带投影坐标失败", e);
        }
    }

    public static void main(String[] args) {

        double[] proj35 = CGCS2000Transformer.transformGeographicTo35N(106.20643354700, 26.64164979200);
        System.out.printf("地理坐标转35带: 北坐标=%.3f, 东坐标=%.3f%n", proj35[0], proj35[1]);

        double[][] COORDINATES = {
                {2948492.00000000000, 35620127.00000000000}
        };

        for (double[] coordinate : COORDINATES) {
            double x = coordinate[1];//地图坐标    x坐标（带带号，如：35620127.000）
            double y = coordinate[0]; // y坐标（如：2948492.000）
            double[] result1 = CGCS2000Transformer.transformToGeographic(x, y);
            System.out.println("方法1结果:");
            System.out.printf("经度: %.9f\n", result1[0]);
            System.out.printf("纬度: %.9f\n", result1[1]);
        }

    }
}