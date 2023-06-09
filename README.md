# 介绍

专门用于bash脚本中的logger，名为```glog_bash```。其中，```g``` for ```郭```。

如果有帮助到你，欢迎```Star```。

有任何需求和问题，可以```联系我guoo@outlook.com```。

# Demo

```shell
. glog_bash.sh
glog_info hello
```

将会得到以下输出：

```shell
2023-06-09 23:00:00 [INFO] hello
```

# 指定输出文件

```shell
FLAG_GLOG_FILE="test.log"
. glog_bash.sh
glog_info hello
```

日志将会输出到当前目录下的一个文件：**test.log**。

# 指定日志等级

```shell
FLAG_GLOG_LEVEL="WARN"
. glog_bash.sh
glog_info "info"      # 不会有任何输出
glog_err "err"        # 会输出日志，如2023-06-10 01:10:00 [ERROR] err
```

目前支持以下日志等级：

* DEBUG：使用glog_debug进行输出

* INFO：使用glog_info进行输出

* WARN：使用glog_warn进行输出

* ERROR：使用glog_err进行输出
