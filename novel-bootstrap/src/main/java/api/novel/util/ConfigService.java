package api.novel.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * ConfigService : 用来读取配置文件工具类
 * 
 * @author XianSky
 *
 */
public class ConfigService {

	private static Log log = (Log) LogFactory.getLog(ConfigService.class);
	private static final String PROJECT_NAME = "novel-bootstrap";

	public static Map<String, Properties> sectionMap = new HashMap();
	private static final String CONFIG_FILE_NAME = "config.properties";

	/**
	 * 读取配置文件里具体区域下的KEY对应的值。 CONFIG_FILE_NAME : [sectionName] KEY = VALUE
	 * 
	 * @param sectionName
	 *            区域名
	 * @param propertyName
	 *            key值
	 * @return
	 */
	public static String getValue(String sectionName, String propertyName) {
		String value = null;
		Properties properties = (Properties) sectionMap.get(sectionName);

		if (properties != null) {
			value = properties.getProperty(propertyName);
		}
		return value;

	}

	// 初始化一些系统默认配置,sectionMap
	static {
		String sTempPath2 = ConfigService.class.getResource("/").toString().substring(6);
//		System.out.println(System.getProperty("user.dir"));
//		System.out.println("1"+new File("").getAbsolutePath());
//		// 获取clsspath绝路径
//		System.out.println("2"+ConfigService.class.getResource("/"));
//		System.out.println("3"+Thread.currentThread().getContextClassLoader().getResource(""));
//		System.out.println("4"+ConfigService.class.getClassLoader().getResource(""));

		String sPath = sTempPath2+ CONFIG_FILE_NAME;
		System.out.println("config.properties path >> :" + sPath);
		log.info("config.properties file path>> " + sPath);
		// 使用bufferedreader读取配置文件
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new FileReader(sPath));
			String line = null;
			String currentSectionName = null;
			Properties currentProperties = null;
			while ((line = reader.readLine()) != null) {
				line = line.trim();
				if (line.length() != 0 && (line.charAt(0) != '#')) { // 不处理空白行和注释行
					if (line.matches("\\[.*\\]")) { // section
													// 正则匹配配置文件里面的[sectionName]
						/*
						 * 位置： A B replaceFirst("\\[(.*)\\]", "$1")
						 * $1表示引用前面位置第一次出现的(.*),极为括号内字符
						 * 也就是用B位置中引用的A正则中括号的字符串替换整个A位置的内容。 eg: [haha] -->替换成
						 * haha
						 */
						currentSectionName = line.replaceFirst("\\[(.*)\\]", "$1");
						currentProperties = new Properties();
						sectionMap.put(currentSectionName, currentProperties);
					} else if ((line.matches(".*=.*")) && (currentProperties != null)) { // 读取KEY-VALUE键值对
						int i = line.indexOf('=');
						currentProperties.setProperty(line.substring(0, i).trim(), line.substring(i + 1).trim());
					}

				}
			}
			reader.close();
		} catch (FileNotFoundException e) {
			// TODO: handle exception
			log.error("Unable to find property file.");
		} catch (IOException e) {
			log.error("Unable to read content of property file.");
		}
	}

}
