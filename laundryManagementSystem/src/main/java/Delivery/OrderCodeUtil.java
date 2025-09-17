package Delivery;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class OrderCodeUtil {

    public static String generateOrderCode() {
        // Prefix + Date + Random Number (e.g., ORD20250512152749 + 3-digit random)
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String timestamp = sdf.format(new Date());

        Random rand = new Random();
        int randomNum = 100 + rand.nextInt(900); // 3-digit random number

        return "ORD" + timestamp + randomNum;
    }
}
