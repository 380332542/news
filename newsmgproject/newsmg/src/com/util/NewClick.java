package com.util;

import redis.clients.jedis.Jedis;

import com.mapper.NewsInfoMapper;

public class NewClick {
	
	private NewsInfoMapper newInfoMapper;
	private Jedis js;
	final int MAX=5;
	
	public NewClick(NewsInfoMapper newInfoMapper)
	{
		this.newInfoMapper=newInfoMapper;
		js=new Jedis("localhost",6379);
	}
	
	public int getNewsClickNum(int newsid)
	{
	
		
		
		if(js.exists("news_"+newsid))
		{
			//�������key   1.ȡ��  2.splitvalue  oldvalue,clicknum
			String getValue=js.get("news_"+newsid);
			int oldCount = Integer.valueOf(getValue.split(",")[0]);
			int refCount = Integer.valueOf(getValue.split(",")[1]);
			refCount=refCount+1;
			if(refCount>=5)
			{
				//�������ݿ�
				newInfoMapper.updateNewsClickNum(newsid, oldCount+refCount);
				js.set("news_"+newsid, oldCount+refCount+","+0);
				
			}
			else
			{
				js.set("news_"+newsid, oldCount+","+refCount);
			}
			return oldCount+refCount;
		}
		
		else
		{
			//��ѯ���ݿ⣬��ȡ�������
			int oldCount=newInfoMapper.getNewsClickNum(newsid);
			System.out.println("��ѯ��"+newsid+"�����:"+newsid);

			
			//���뵽redis
			js.set("news_"+newsid, oldCount+","+1);
			
			
			return oldCount+1;
			
		}
		
		
		

	}
	
	
	public void close(){
		js.close();
	}
}
