package common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class  JSONHelper {

	/**
     * 将传递近来的json对象转换为Map集合
     *
     * @param jsonObj
     * @return
     * @throws JSONException
     */
    public static Map<String, Object> jsonToMap(JSONObject jsonObj)
            throws JSONException {
        Map<String, Object> jsonMap = new HashMap<String, Object>();
        Iterator<String> jsonKeys = jsonObj.keys();
        while (jsonKeys.hasNext()) {
            String jsonKey = jsonKeys.next();
            Object jsonValObj = jsonObj.get(jsonKey);
            if (jsonValObj instanceof JSONArray) {
                jsonMap.put(jsonKey, JSONHelper.jsonToList((JSONArray) jsonValObj));
            } else if (jsonValObj instanceof JSONObject) {
                jsonMap.put(jsonKey, JSONHelper.jsonToMap((JSONObject) jsonValObj));
            } else {
                jsonMap.put(jsonKey, jsonValObj);
            }
        }
        return jsonMap;
    }
    
    /**
     * 将传递近来的json数组转换为List集合
     *
     * @param jsonArr
     * @return
     * @throws JSONException
     */
    public static List<?> jsonToList(JSONArray jsonArr)
            throws JSONException {
        List<Object> jsonToMapList = new ArrayList<Object>();
        for (int i = 0; i < jsonArr.length(); i++) {
            Object object = jsonArr.get(i);
            if (object instanceof JSONArray) {
                jsonToMapList.add(JSONHelper.jsonToList((JSONArray) object));
            } else if (object instanceof JSONObject) {
                jsonToMapList.add(JSONHelper.jsonToMap((JSONObject) object));
            } else {
                jsonToMapList.add(object);
            }
        }
        return jsonToMapList;
    }
}
