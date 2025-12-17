package com.by.devtool.coor;

/**
 * @author bandd
 * @date2025年12月17日10:20
 *
 *https://cn.bing.com/search?q=proj%20%E5%9D%90%E6%A0%87%E8%BD%AC%E6%8D%A2%20java&qs=n&form=QBRE&sp=-1&lq=0&pq=proj%20%E5%9D%90%E6%A0%87%E8%BD%AC%E6%8D%A2%20java&sc=12-14&sk=&cvid=D33E9AD8CC14450493E2C95A60FEE453
 *
 * https://blog.csdn.net/tuxin1989/article/details/133088943
 *
 * https://epsg.io/4490
 *
 * https://www.cnblogs.com/tangjielin/p/16561258.html
 *
 */
import org.locationtech.proj4j.*;

public class CGCS2000Transformer {

    // 35带中央经线 = 35*3 - 105 = 105°
    private static final String CGCS2000_35N = "+proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=35500000 +y_0=0 +ellps=GRS80 +units=m +no_defs";

    // 36带中央经线 = 36*3 - 105 = 108°
    private static final String CGCS2000_36N = "+proj=tmerc +lat_0=0 +lon_0=108 +k=1 +x_0=36500000 +y_0=0 +ellps=GRS80 +units=m +no_defs";

    // 目标
    private static final String mb = "+proj=longlat +ellps=GRS80 +no_defs";

    private static CRSFactory crsFactory = new CRSFactory();
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
            CoordinateReferenceSystem targetCRS = crsFactory.createFromParameters("EPSG:4490",mb);

            CoordinateTransform transform = ctFactory.createTransform(sourceCRS, targetCRS);

            // 去掉35带号：35620127 -> 620127，源中已处理了就不需要再此处理   35500000
            // double easting = x - 35000000;
            double easting = x;;

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
            CoordinateReferenceSystem sourceCRS = crsFactory.createFromParameters("EPSG:CGCS2000_36N", CGCS2000_36N);
            CoordinateReferenceSystem targetCRS = crsFactory.createFromParameters("EPSG:4490",mb);
            CoordinateTransform transform = ctFactory.createTransform(sourceCRS, targetCRS);

            // 去掉36带号：36620127 -> 620127，源中已处理了就不需要再此处理
            // double easting = x - 36000000;
            double easting = x;
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


    public double[] transformGeographicTo35N(double lon, double lat) {
        try {
            CoordinateReferenceSystem sourceCRS = crsFactory.createFromParameters("WGS84", mb);
            CoordinateReferenceSystem targetCRS = crsFactory.createFromParameters("CGCS2000_35N", CGCS2000_35N);

            CoordinateTransform transform = ctFactory.createTransform(sourceCRS, targetCRS);

            ProjCoordinate srcCoord = new ProjCoordinate(lon, lat);
            ProjCoordinate tgtCoord = new ProjCoordinate();

            transform.transform(srcCoord, tgtCoord);

            // 添加带号：620127 -> 35620127
            double easting = tgtCoord.x;

            return new double[]{tgtCoord.y, easting};

        } catch (Exception e) {
            throw new RuntimeException("地理坐标转35带投影坐标失败", e);
        }
    }


    public static void main(String[] args) {
        CGCS2000Transformer transformer = new CGCS2000Transformer();


        double[] proj35 = transformer.transformGeographicTo35N(106.20643354700, 26.64164979200);
        System.out.printf("地理坐标转35带: 北坐标=%.3f, 东坐标=%.3f%n", proj35[0], proj35[1]);

        double[][] COORDINATES = {
                {2948492.00000000000, 35620127.00000000000},
                {2948300.45300000000, 35619805.46400000000},
                {2948116.43800000000, 35619934.31200000000},
                {2948237.40700000000, 35620211.19500000000},
                {2948094.47900000000, 35620438.07300000000},
                {2947559.76400000000, 35619731.46700000000},
                {2947938.94400000000, 35619198.62100000000},
                {2947494.02300000000, 35618451.76300000000},
                {2947139.89100000000, 35618708.01400000000},
                {2946783.33100000000, 35618543.10700000000},
                {2947173.66200000000, 35618273.54900000000},
                {2946989.55700000000, 35618036.15700000000},
                {2947135.71100000000, 35617933.81000000000},
                {2946675.00000000000, 35617367.00000000000},
                {2946217.87300000000, 35618191.49500000000},
                {2945986.00000000000, 35619096.00000000000},
                {2946211.00000000000, 35619094.00000000000},
                {2946216.05900000000, 35619602.81400000000},
                {2946502.81000000000, 35620299.47100000000},
                {2946589.00000000000, 35620299.00000000000},
                {2946662.86200000000, 35620300.85100000000},
                {2946860.56300000000, 35619699.80800000000},
                {2947206.78200000000, 35619700.87200000000},
                {2947300.45700000000, 35620368.68300000000},
                {2947483.00000000000, 35620408.00000000000},
                {2947478.00000000000, 35620443.00000000000},
                {2947550.00000000000, 35620425.00000000000},
                {2947776.05500000000, 35620577.91900000000},
                {2947753.00000000000, 35620612.00000000000},
                {2947737.00000000000, 35620792.00000000000},
                {2947809.82200000000, 35620843.11100000000},
                {2947822.53300000000, 35620805.62500000000},
                {2947864.97500000000, 35620775.66200000000},
                {2947865.02100000000, 35620757.90400000000},
                {2947845.90000000000, 35620704.39900000000},
                {2947869.19400000000, 35620679.35000000000},
                {2947916.84800000000, 35620657.95300000000},
                {2947932.97600000000, 35620677.59100000000},
                {2947966.55600000000, 35620677.70200000000}
        };

//        for (double[] coordinate : COORDINATES) {
//            double x = coordinate[0];
//            double y = coordinate[1];
//            double[] result1 = transformer.transformToGeographic(x, y);
//            System.out.println("方法1结果:");
//            System.out.printf("经度: %.9f\n", result1[0]);
//            System.out.printf("纬度: %.9f\n", result1[1]);
//        }

    }
}