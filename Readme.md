# 中国行政区编码表

这里收集了从1980年到当前的行政区编码数据，数据来源为[民政部官网](http://www.mca.gov.cn)。创建这个仓库主要有下面两个目的：

1. 备份数据。
2. 因为民政部每次更新数据都历史编码会丢失，这会导致历史编码的身份证解码出错，为了避免这个问题，这里用一个简单的脚本进行合并去重，提供给[github.com/sleagon/chinaid](https://github.com/sleagon/chinaid)这个包使用。

## 文件结构

city.raw.txt 是原始数据
city.fmt.txt 是去重并格式化以后的数据

## 格式化脚本

```bash
cat city.raw.txt| egrep '^[0-9]+\s+.*' | awk -F '[ \t]+' '{print $1,$2}' | sort -n -k 1 -u | awk '{ printf ("%d:\"%s\",\n", $1, $2) }' > city.fmt.txt
```

## 更新
每次更新过程很简单，分为下面三步：

1. 去民政部官网下载最新的需要插入的文本，比如2019年的：http://www.mca.gov.cn/article/sj/xzqh/2019/201901-06/201905271021.html ,把复制的文本直接插入到city.raw.txt的最前面即可。
2. 执行```bash fmt.sh```。
3. 提交代码。