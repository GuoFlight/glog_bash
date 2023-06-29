#!/bin/bash

################################################
# 作者：郭少
# 版本：v0.2
# 最近一次更新时间：2023-06-29
################################################


GLOG_LEVEL_DEBUG="DEBUG"
GLOG_LEVEL_INFO="INFO"
GLOG_LEVEL_WARN="WARN"
GLOG_LEVEL_ERROR="ERROR"
GLOG_LEVEL=2                # 默认日志等级
GLOG_FILE="/dev/stdout"

function init(){
    # 初始化日志等级
    [ "${FLAG_GLOG_LEVEL}" == "${GLOG_LEVEL_DEBUG}" ] && GLOG_LEVEL=1
    [ "${FLAG_GLOG_LEVEL}" == "${GLOG_LEVEL_WARN}" ] && GLOG_LEVEL=3
    [ "${FLAG_GLOG_LEVEL}" == "${GLOG_LEVEL_ERROR}" ] && GLOG_LEVEL=4
    # 初始化日志文件
    if [ "${FLAG_GLOG_FILE}" != "" ] && [ "${FLAG_GLOG_FILE}" != "/dev/stdout"  ]; then
        GLOG_FILE=${FLAG_GLOG_FILE}
        if [ ! -e "${FLAG_GLOG_FILE}" ]; then
            glog_file_dir=`dirname ${FLAG_GLOG_FILE}`
            mkdir -p ${glog_file_dir}
        elif [ ! -f "${FLAG_GLOG_FILE}" ]; then
            echo "ERROR：${FLAG_GLOG_FILE} is already exists and is not a file"
            return 1
        fi
    fi
}

function print_log(){
    echo -e "$*" &>> "$GLOG_FILE"
}
function glog_debug(){
    [ ${GLOG_LEVEL} -gt 1 ] && return
    print_log $(date +"%Y-%m-%d %H:%M:%S") [${GLOG_LEVEL_DEBUG}] $*
}
function glog_info(){
    [ ${GLOG_LEVEL} -gt 2 ] && return
    print_log $(date +"%Y-%m-%d %H:%M:%S") [${GLOG_LEVEL_INFO}] $1
}
function glog_warn(){
    [ "${GLOG_LEVEL}" -gt 3 ] && return
    print_log $(date +"%Y-%m-%d %H:%M:%S") [${GLOG_LEVEL_WARN}] $*
}
function glog_err(){
    [ ${GLOG_LEVEL} -gt 4 ] && return
    print_log $(date +"%Y-%m-%d %H:%M:%S") [${GLOG_LEVEL_ERROR}] $*
}

init
