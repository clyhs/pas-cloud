package com.pas.cloud.sharding.config;

import java.util.Collection;
import java.util.LinkedHashSet;

import com.dangdang.ddframe.rdb.sharding.api.ShardingValue;
import com.dangdang.ddframe.rdb.sharding.api.strategy.database.SingleKeyDatabaseShardingAlgorithm;
import com.google.common.collect.Range;

public class PasCloudSingleKeyDatabaseShardingAlgorithm implements
		SingleKeyDatabaseShardingAlgorithm<Integer> {
	
	

	public String doEqualSharding(Collection<String> dataSourceNames,
			ShardingValue<Integer> shardingValue) {
		// TODO Auto-generated method stub
		for (String each : dataSourceNames) {
            if (each.endsWith(shardingValue.getValue() % 2 + "")) {
                return each;
            }
        }
        throw new IllegalArgumentException();
	}

	public Collection<String> doInSharding(
			Collection<String> dataSourceNames,
			ShardingValue<Integer> shardingValue) {
		// TODO Auto-generated method stub
		Collection<String> result = new LinkedHashSet<String>(dataSourceNames.size());
        for (Integer value : shardingValue.getValues()) {
            for (String dataSourceName : dataSourceNames) {
                if (dataSourceName.endsWith(value % 2 + "")) {
                    result.add(dataSourceName);
                }
            }
        }
        return result;
	}

	public Collection<String> doBetweenSharding(
			Collection<String> dataSourceNames,
			ShardingValue<Integer> shardingValue) {
		// TODO Auto-generated method stub
		Collection<String> result = new LinkedHashSet<String>(dataSourceNames.size());
		Range<Integer> range = shardingValue.getValueRange();
        for (Integer i = range.lowerEndpoint(); i <= range.upperEndpoint(); i++) {
            for (String each : dataSourceNames) {
                if (each.endsWith(i % 2 + "")) {
                    result.add(each);
                }
            }
        }
        return result;
	}

	 

}
