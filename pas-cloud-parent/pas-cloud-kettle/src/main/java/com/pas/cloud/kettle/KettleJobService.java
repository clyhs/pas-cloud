package com.pas.cloud.kettle;

import org.pentaho.di.job.Job;
import org.pentaho.di.job.JobMeta;
import org.pentaho.di.repository.Repository;
import org.pentaho.di.repository.RepositoryDirectoryInterface;
import org.pentaho.di.www.JobMap;

public class KettleJobService {

	private static JobMap jobMap = new JobMap();

	private KettleRepositoryService krs;

	public KettleJobService(KettleRepositoryService krs) {
		this.krs = krs;
	}

	public void execute(String repName, String username, String password,
			String filePath, String fileName) {
		Repository r = null;
		RepositoryDirectoryInterface rdi = null;
		JobMeta jobMeta = new JobMeta();
		System.out.println("**********job start:"+filePath+"**********");
		try {
			r = krs.getRepository(repName, username, password);
			rdi = krs.getDirectory(r, filePath);
			System.out.println("************"+rdi.getPath()+"*****************");
			jobMeta = r.loadJob(fileName, rdi, null, null);

			executeJob(r, jobMeta);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void executeJob(Repository rep, JobMeta jobMeta) {

		Job job = null;
		try {
			if (rep != null) {
				job = new Job(rep, jobMeta);
				job.start();
				job.waitUntilFinished();
			}
		} catch (Exception e) {

		}
	}

	public void stopJob(String jobName) {

		try {
			Job job = jobMap.getJob(jobName);
			job.stopAll();
		} catch (Exception ex) {

		}

	}
}
