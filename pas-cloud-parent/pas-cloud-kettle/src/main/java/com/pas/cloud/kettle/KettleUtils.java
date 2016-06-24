package com.pas.cloud.kettle;

import java.util.ArrayList;
import java.util.Properties;

import org.pentaho.di.core.KettleEnvironment;
import org.pentaho.di.core.database.DatabaseMeta;
import org.pentaho.di.core.exception.KettleException;
import org.pentaho.di.core.logging.LogChannel;
import org.pentaho.di.core.plugins.PluginRegistry;
import org.pentaho.di.core.plugins.RepositoryPluginType;
import org.pentaho.di.core.util.EnvUtil;
import org.pentaho.di.repository.RepositoriesMeta;
import org.pentaho.di.repository.Repository;
import org.pentaho.di.repository.RepositoryMeta;
import org.pentaho.di.repository.filerep.KettleFileRepository;
import org.pentaho.di.repository.filerep.KettleFileRepositoryMeta;
import org.pentaho.di.repository.kdr.KettleDatabaseRepository;
import org.pentaho.di.repository.kdr.KettleDatabaseRepositoryMeta;
import org.pentaho.di.www.JobMap;
import org.pentaho.di.www.TransformationMap;

/**
 * 
 * @author chenly 
 *
 * @version createtime:2016-6-24 下午12:08:20
 */
public class KettleUtils {
	
	private  static JobMap jobMap = new JobMap();
	private  static TransformationMap transMap = new TransformationMap();
	private  static LogChannel logChannel ;
	
	private  static DatabaseMeta databaseMeta;
	private  static Properties   databaseProperties;
	
	{
		try {
			KettleRepositoryService kps = new KettleRepositoryService();
			//KettleEnvironment.init();
			logChannel = new LogChannel("spoon");
			//getVariables();
			//getRepositories();
			//getRepository("eee","admin","admin");
			//createKettleFileRepository("dd2","dd2");
			//createKettleDatabaseRepository("kettle02");
			databaseMeta = kps.initDatabase();
			databaseProperties = kps.initDatabaseProperties();
			//System.out.println(checkDatabaseRepository("localhost"));
			//checkDatabaseConnection(databaseMeta);
			
			kps.createDatabaseRepository(databaseMeta,databaseProperties);
			
			kps.createKettleDatabaseRepository("ddrr",databaseMeta,databaseProperties);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
	}
	
//	private static void getVariables(){
//		System.out.println("*****var start*****");
//		for(String s:EnvUtil.getEnvironmentVariablesForRuntimeExec()){
//			
//			String[] vs = s.split("=");
//			
//			System.out.println(s);
//		}
//		System.out.println("*****var end*****");
//	}
//	
//	private static void getRepositories(){
//		ArrayList list = new ArrayList();
//		RepositoriesMeta rms = new RepositoriesMeta();
//		int i = 0;
//		System.out.println("*****reps start*****");
//		try {
//			rms.readData();
//		    i= rms.nrRepositories();
//			
//			for (int j = 0; j < i; j++){
//				RepositoryMeta rm =  rms.getRepository(j);
//				String name = rm.getName();
//				String id = rm.getId();
//				System.out.println(id);
//				System.out.println(name);
//				list.add(name);
//			}
//		} catch (Exception e) {
//		}
//		System.out.println("*****reps end*****");
//	}
//	
//	
//	private static void getRepository(String repName,String username,String password){
//		RepositoriesMeta rsMeta = new RepositoriesMeta();
//		RepositoryMeta   repMeta  = null;
//		Repository       rep  = null;
//		PluginRegistry   pluginRep = null;   
//		RepositoryPluginType rpy = RepositoryPluginType.getInstance();
//		System.out.println("*****repository start*****");
//		try {
//			rsMeta.readData();
//			repMeta = rsMeta.findRepository(repName);
//			pluginRep = PluginRegistry.getInstance();
//			
//			rep =  pluginRep.loadClass(RepositoryPluginType.class, repMeta, Repository.class); 
//			rep.init(repMeta);
//			rep.connect(username, password);
//			System.out.println("*****repository connected:"+rep.isConnected()+"*****");
//			//rep.isConnected();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		System.out.println("*****repository end*****");
//		
//	}
//	
//	public static void createKettleFileRepository(String repName,String desc){
//		RepositoriesMeta rsMeta = new RepositoriesMeta();
//		KettleFileRepositoryMeta kfm = null;
//		//KettleFileRepository rep = new KettleFileRepository();  
//		System.out.println("*****repository create start*****");
//		int i = 0;
//		try {
//			rsMeta.readData();
//			kfm = new KettleFileRepositoryMeta();		
//			kfm.setId("KettleFileRepository");
//			kfm.setName(repName);
//			kfm.setDescription(desc);
//			kfm.setBaseDirectory(repName);
//			
//			rsMeta.addRepository(kfm);
//			if(!checkFileRepository(repName)){
//				System.out.println("*****repository is creating*****");
//				rsMeta.writeData();
//			}else{
//				System.out.println("*****repository had created*****");
//			}
//			
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		System.out.println("*****repository create end*****");
//	}
//	
//	public static boolean checkFileRepository(String repName){
//		boolean flag = false;
//		RepositoriesMeta rsMeta = new RepositoriesMeta();
//		RepositoryMeta   repMeta  = null;
//		System.out.println("*****check repository start*****");
//		try {
//			rsMeta.readData();
//			repMeta = rsMeta.findRepository(repName);
//			if(null == repMeta){
//				
//			}else{
//				flag = true;
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		System.out.println("*****check repository end*****");
//		return flag;
//	}
//	private static boolean checkDatabaseConnection(DatabaseMeta dm){
//		boolean flag = false;
//		try{
//			String result = dm.testConnection();
//			//System.out.println(result);
//			if(result.startsWith("错误连接数据库")){
//				System.out.println("测试连接失败");
//			}
//			if(result.startsWith("正确连接到数据库")){
//				flag = true;
//				System.out.println("测试连接成功");
//			}
//			
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//		return flag;
//		
//	}
//	private static DatabaseMeta initDatabase(){
//		DatabaseMeta dm = new DatabaseMeta();
//		dm.setDBName("kettle");
//		dm.setDBPort("3306");
//		dm.setHostname("localhost");
//		dm.setServername("localhost");
//		dm.setDatabaseType("MYSQL");
//		dm.setName("localhost");
//		dm.setUsername("root");
//		dm.setPassword("123456");
//		dm.setStreamingResults(true);
//		dm.setAccessType(0);
//		dm.setDataTablespace("");
//		dm.setIndexTablespace("");
//		return dm;
//	} 
//	
//	private static Properties initDatabaseProperties(){
//		Properties p = new Properties();
//		p.setProperty("EXTRA_OPTION_MYSQL.defaultFetchSize", "500");
//		p.setProperty("EXTRA_OPTION_MYSQL.useCursorFetch", "true");
//		p.setProperty("FORCE_IDENTIFIERS_TO_LOWERCASE", "N");
//		p.setProperty("FORCE_IDENTIFIERS_TO_UPPERCASE", "N");
//		p.setProperty("IS_CLUSTERED", "N");
//		p.setProperty("PORT_NUMBER", "3306");
//		p.setProperty("PRESERVE_RESERVED_WORD_CASE", "Y");
//		p.setProperty("QUOTE_ALL_FIELDS", "N");
//		p.setProperty("STREAM_RESULTS", "Y");
//		p.setProperty("SUPPORTS_BOOLEAN_DATA_TYPE", "Y");
//		p.setProperty("SUPPORTS_TIMESTAMP_DATA_TYPE", "Y");
//		p.setProperty("USE_POOLING", "N");
//		return p;
//	}
//	
//	private static boolean checkDatabaseRepository(String dataName){
//		boolean flag = false;
//		RepositoriesMeta rsMeta = new RepositoriesMeta();
//		DatabaseMeta dm = new DatabaseMeta();
//		System.out.println("*****check data repository start*****");
//		try {
//			rsMeta.readData();
//			dm = rsMeta.searchDatabase(dataName);
//			if(null==dm){
//				
//			}else{
//				flag = true;
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		System.out.println("*****check data repository end*****");
//		return flag;
//	}
//	
//	public static void createKettleDatabaseRepository(String repName,DatabaseMeta dm,Properties p){
//		KettleDatabaseRepositoryMeta kdpm = new KettleDatabaseRepositoryMeta();
//		RepositoriesMeta rsMeta = new RepositoriesMeta();
//		System.out.println("*****data file repository create start*****");
//		try {
//			//如果不先读出数据，后面写入会覆盖掉
//			rsMeta.readData();
//			dm.setAttributes(p);
//			kdpm.setConnection(dm);
//			kdpm.setId("KettleDatabaseRepository");
//			kdpm.setName(repName);
//			rsMeta.addRepository(kdpm);
//			
//			if(!checkFileRepository(repName)){
//				System.out.println("*****data file repository is creating*****");
//				rsMeta.writeData();
//			}else{
//				System.out.println("*****data file repository had created*****");
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		System.out.println("*****data file repository create end*****");
//	}
//	
//	private static void createDatabaseRepository(DatabaseMeta dm,Properties p){
//		RepositoriesMeta rsMeta = new RepositoriesMeta();
//		System.out.println("*****data repository create start*****");
//		try {
//			//如果不先读出数据，后面写入会覆盖掉
//			rsMeta.readData();
//			dm.setAttributes(p);
//			rsMeta.addDatabase(dm);
//			if(!checkDatabaseRepository(dm.getName())){
//				rsMeta.writeData();
//			}
//			System.out.println();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		System.out.println("*****data repository create end*****");
//	} 
	
	
	
	
	public static void main(String[] args){
		KettleUtils ku = new KettleUtils();
	}

}
