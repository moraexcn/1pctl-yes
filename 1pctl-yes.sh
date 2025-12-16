#!/bin/bash

# 主菜单函数
main_menu() {
  clear
  echo -e "────────────────────────────────────────────────────────"
  echo -e " \033[42;30m 1pctl一键增强脚本 1pctl-yes \033[0m         "
  echo -e " \033[42;30m 基于1pctl https://1panel.cn/docs/v2/installation/cli/ \033[0m"
  echo -e "────────────────────────────────────────────────────────"
  echo ""
  echo "主菜单"
  echo ""
  echo "0.  退出脚本"
  echo "1.  1pctl                      # 基础 1panel系统服务"
  echo "2.  1pctl reset                # 重置 1Panel 系统信息等"
  echo "3.  1pctl listen-ip            # 修改 1Panel 监听 IP"
  echo "4.  1pctl update               # 修改 1Panel 系统信息"
  echo ""
  echo "提示："
  echo "  - 输入 1~4 选择对应功能，输入 0 退出脚本。"
  echo "  - 若进入子菜单，输入 0 返回上一级菜单。"
  echo ""
  read -p "请输入数字选择：" choice

  case $choice in
    0) exit 0 ;;
    1) pctl_submenu ;;
    2) reset_submenu ;;
    3) listen_ip_submenu ;;
    4) update_submenu ;;
    *) echo "无效输入，请重新选择！" ; sleep 1 ; main_menu ;;
  esac
}

# restart 子菜单函数
restart_submenu() {
  clear
  echo "restart 子菜单"
  echo ""
  echo "0.  返回1pctl菜单"
  echo "1.  Core                      # 重启核心"
  echo "2.  agent                     # 重启代理"
  echo "3.  all                       # 全部重启"
  echo ""
  echo "提示："
  echo "  - 输入对应数字执行命令，0 返回上一级菜单。"
  echo ""
  read -p "请输入数字选择：" choice

  case $choice in
    0) main_menu ;;
    1) 1pctl restart core ; read -p "按任意键返回菜单..." ; restart_submenu ;;
    2) 1pctl restart agent ; read -p "按任意键返回菜单..." ; restart_submenu ;;
    3) 1pctl restart all ; read -p "按任意键返回菜单..." ; restart_submenu ;;
    *) echo "无效输入，请重新选择！" ; sleep 1 ; restart_submenu ;;
  esac
}

# stop 子菜单函数
stop_submenu() {
  clear
  echo "stop 子菜单"
  echo ""
  echo "0.  返回1pctl菜单"
  echo "1.  Core                      # 停止核心"
  echo "2.  agent                     # 停止代理"
  echo "3.  all                       # 停止全部"
  echo ""
  echo "提示："
  echo "  - 输入对应数字执行命令，0 返回上一级菜单。"
  echo ""
  read -p "请输入数字选择：" choice

  case $choice in
    0) main_menu ;;
    1) 1pctl stop core ; read -p "按任意键返回菜单..." ; stop_submenu ;;
    2) 1pctl stop agent ; read -p "按任意键返回菜单..." ; stop_submenu ;;
    3) 1pctl stop all ; read -p "按任意键返回菜单..." ; stop_submenu ;;
    *) echo "无效输入，请重新选择！" ; sleep 1 ; stop_submenu ;;
  esac
}

# start 子菜单函数
start_submenu() {
  clear
  echo "start 子菜单"
  echo ""
  echo "0.  返回1pctl菜单"
  echo "1.  Core                      # 启动核心"
  echo "2.  agent                     # 启动代理"
  echo "3.  all                       # 全部启动"
  echo ""
  echo "提示："
  echo "  - 输入对应数字执行命令，0 返回上一级菜单。"
  echo ""
  read -p "请输入数字选择：" choice

  case $choice in
    0) main_menu ;;
    1) 1pctl start core ; read -p "按任意键返回菜单..." ; start_submenu ;;
    2) 1pctl start agent ; read -p "按任意键返回菜单..." ; start_submenu ;;
    3) 1pctl start all ; read -p "按任意键返回菜单..." ; start_submenu ;;
    *) echo "无效输入，请重新选择！" ; sleep 1 ; start_submenu ;;
  esac
}

# status 子菜单函数
status_submenu() {
  clear
  echo "status 子菜单"
  echo ""
  echo "0.  返回1pctl菜单"
  echo "1.  Core                      # 检查核心"
  echo "2.  agent                     # 检查代理"
  echo ""
  echo "提示："
  echo "  - 输入对应数字执行命令，0 返回上一级菜单。"
  echo ""
  read -p "请输入数字选择：" choice

  case $choice in
    0) main_menu ;;
    1) 1pctl status core ; read -p "按任意键返回菜单..." ; status_submenu ;;
    2) 1pctl status agent ; read -p "按任意键返回菜单..." ; status_submenu ;;
    *) echo "无效输入，请重新选择！" ; sleep 1 ; status_submenu ;;
  esac
}

# 1pctl 子菜单函数
pctl_submenu() {
  clear
  echo "1pctl 子菜单"
  echo ""
  echo "0.  返回主菜单"
  echo ""
  echo "1.  status                     # 检查 1Panel 服务状态（菜单）"
  echo "2.  start                      # 启动 1Panel 服务（菜单）"
  echo "3.  stop                       # 停止 1Panel 服务（菜单）"
  echo "4.  restart                    # 重启 1Panel 服务（菜单）"
  echo "5.  uninstall                  # 卸载 1Panel 服务（执行该命令可能导致不可逆的后果，请谨慎评估后再操作！）"
  echo "6.  user-info                  # 获取 1Panel 用户信息"
  echo "7.  version                    # 查看 1Panel 版本信息"
  echo "8.  restore                    # 恢复 1Panel 服务及数据（执行该命令可能导致不可逆的后果，请谨慎评估后再操作！）"
  echo ""
  echo "提示："
  echo "  - 输入对应数字进入子菜单或执行命令，0 返回上一级菜单。"
  echo ""
  read -p "请输入数字选择：" choice

  case $choice in
    0) main_menu ;;
    1) status_submenu ;;
    2) start_submenu ;;
    3) stop_submenu ;;
    4) restart_submenu ;;
    5) 1pctl uninstall ; read -p "按任意键返回菜单..." ; pctl_submenu ;;
    6) 1pctl user-info ; read -p "按任意键返回菜单..." ; pctl_submenu ;;
    7) 1pctl version ; read -p "按任意键返回菜单..." ; pctl_submenu ;;
    8) 1pctl restore ; read -p "按任意键返回菜单..." ; pctl_submenu ;;
    *) echo "无效输入，请重新选择！" ; sleep 1 ; 1pctl submenu ;;
  esac
}

# 1pctl reset 子菜单函数
reset_submenu() {
  clear
  echo "1pctl reset 子菜单"
  echo ""
  echo "0.  返回主菜单"
  echo ""
  echo "1.  domain                     # 取消 1Panel 访问域名绑定"
  echo "2.  entrance                   # 取消 1Panel 安全入口"
  echo "3.  https                      # 取消 1Panel https 方式登录"
  echo "4.  ips                        # 取消 1Panel 授权 IP 限制"
  echo "5.  mfa                        # 取消 1Panel 两步验证"
  echo ""
  echo "提示："
  echo "  - 输入对应数字执行对应重置操作，0 返回主菜单。"
  echo ""
  read -p "请输入数字选择：" choice

  case $choice in
    0) main_menu ;;
    1) 1pctl reset domain ; read -p "按任意键返回菜单..." ; reset_submenu ;;
    2) 1pctl reset entrance ; read -p "按任意键返回菜单..." ; reset_submenu ;;
    3) 1pctl reset https ; read -p "按任意键返回菜单..." ; reset_submenu ;;
    4) 1pctl reset ips ; read -p "按任意键返回菜单..." ; reset_submenu ;;
    5) 1pctl reset mfa ; read -p "按任意键返回菜单..." ; reset_submenu ;;
    *) echo "无效输入，请重新选择！" ; sleep 1 ; reset_submenu ;;
  esac
}

# 1pctl listen-ip 子菜单函数
listen_ip_submenu() {
  clear
  echo "1pctl listen-ip 子菜单"
  echo ""
  echo "0.  返回主菜单"
  echo ""
  echo "1.  ipv4                       # 监听 IPv4"
  echo "2.  ipv6                       # 监听 IPv6"
  echo ""
  echo "提示："
  echo "  - 输入 1 或 2 选择监听协议，0 返回主菜单。"
  echo ""
  read -p "请输入数字选择：" choice

  case $choice in
    0) main_menu ;;
    1) 1pctl listen-ip ipv4 ; read -p "按任意键返回菜单..." ; listen_ip_submenu ;;
    2) 1pctl listen-ip ipv6 ; read -p "按任意键返回菜单..." ; listen_ip_submenu ;;
    *) echo "无效输入，请重新选择！" ; sleep 1 ; listen_ip_submenu ;;
  esac
}

# 1pctl update 子菜单函数
update_submenu() {
  clear
  echo "1pctl update 子菜单"
  echo ""
  echo "0.  返回主菜单"
  echo ""
  echo "1.  username                   # 修改面板用户"
  echo "2.  password                   # 修改面板密码"
  echo "3.  port                       # 修改面板端口"
  echo ""
  echo "提示："
  echo "  - 输入 1~3 选择要修改的面板配置项，0 返回主菜单。"
  echo ""
  read -p "请输入数字选择：" choice

  case $choice in
    0) main_menu ;;
    1) 1pctl update username ; read -p "按任意键返回菜单..." ; update_submenu ;;
    2) 1pctl update password ; read -p "按任意键返回菜单..." ; update_submenu ;;
    3) 1pctl update port ; read -p "按任意键返回菜单..." ; update_submenu ;;
    *) echo "无效输入，请重新选择！" ; sleep 1 ; update_submenu ;;
  esac
}

# 启动脚本
main_menu
