#!/bin/bash
#the script to find and replace the given string

cp conf.cong conf.conf.bak

#Delete  two the line containing this paramater
sed -i '/mapred.tasktracker.map.tasks.maximum/,+2d' conf.conf
sed -i '/mapred.tasktracker.reduce.tasks.maximum/,+2d' conf.conf

echo -n  "how much you want to add in map tasks:"
read number_map_task

echo -n "how much you want to add in  reduce tasks:"
read number_reduce_task

#append this given paramater to the line before </configuration>
sed -i '/\/configuration/i \<property><name>mapred.tasktracker.map.tasks.maximum</name><value>'$number_map_task'</value></property><property><name>mapred.tasktracker.reduce.tasks.maximum</name><value>'$number_reduce_task'</value></property>' conf.conf

