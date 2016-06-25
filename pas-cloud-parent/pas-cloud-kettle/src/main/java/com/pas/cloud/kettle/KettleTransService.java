package com.pas.cloud.kettle;

import org.pentaho.di.core.exception.KettleException;
import org.pentaho.di.job.JobMeta;
import org.pentaho.di.repository.Repository;
import org.pentaho.di.repository.RepositoryDirectoryInterface;
import org.pentaho.di.trans.Trans;
import org.pentaho.di.trans.TransMeta;
import org.pentaho.di.www.TransformationMap;

public class KettleTransService {
	
	private static TransformationMap transMap = new TransformationMap();
	private KettleRepositoryService krs;
	
	public KettleTransService (KettleRepositoryService krs){
		this.krs = krs;
	}
	
	public void execute(String repName, String username,
			String password, String filePath, String fileName){
		Repository r = null;
		RepositoryDirectoryInterface rdi = null;
		JobMeta jobMeta = new JobMeta();
		try{
			r = krs.getRepository(repName, username, password);
			rdi = krs.getDirectory(r, filePath);
			TransMeta tm = r.loadTransformation(fileName, rdi, null, true, null); 
			executeTrans(tm);
		}catch(Exception e){
			
		}
		
	}
	
	public void executeTrans(TransMeta tm){
          
        try {
        	Trans trans = new Trans(tm);
			trans.execute(null);
			trans.waitUntilFinished(); 
		} catch (KettleException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}  
        
	}
	
	public void stopTrans(String transName)
	{
		try{
			Trans trans = transMap.getTransformation(transName);
			if(trans.isRunning()){
				trans.stopAll();
			}
		}catch(Exception ex){


		}
}

}
