# abstraction

```java
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Locale;

class Solution{
    public static String calculateLocation(double latitude, double longitude){
        return northOrSouth(latitude) + "/" + westOrEast(longitude);
    }

    public static String northOrSouth(double latitude) {
        if(latitude > 0){
            return "north";
        } else if(latitude == 0) {
            return "equator";
        } else {
            return "south";
        }
    }

    public static String westOrEast(double longitude) {
        if(longitude > 0){
            return "east";
        } else if(longitude == 0) {
            return "prime meridian";
        } else {
            return "west";
        }
    }    
}
```
