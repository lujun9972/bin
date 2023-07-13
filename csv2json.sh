#!/bin/bash

# 从命令行参数获取csv文件名
csv_file=$1

# 检查是否提供了csv文件名
if [ -z "$csv_file" ]; then
    echo "请提供csv文件名"
    exit 1
fi

# 检查csv文件是否存在
if [ ! -f "$csv_file" ]; then
    echo "csv文件 $csv_file 不存在"
    exit 1
fi

# 用awk命令将csv文件转换为json格式数据
awk  'NR == 1 {
    # 将属性名字符串分割为数组
    split($0, fields, ",")
    # 输出json格式数据的开头
    print "["
    first_record = 1
  }
  NR > 1 {
    # 读取csv文件的每一行数据
    record = $0
    # 将每一行数据分割为数组
    split(record, values, ",")
    # 输出字典数据
    if (!first_record) {
      print ","
    } else {
      first_record = 0
    }
    printf("  {")
    # 输出每个属性名和对应的属性值
    for (i = 1; i <= length(fields); i++) {
      if (i > 1) {
        printf(", ")
      }
      printf("\"%s\": ", fields[i])
      printf("%s", values[i] + 0 == values[i] ? values[i] + 0 : "\"" values[i] "\"")
    }
    printf("}")
  }
  END {
    # 输出json格式数据的结尾
    print "\n]"
  }' "$csv_file"
