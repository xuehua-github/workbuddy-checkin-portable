# WorkBuddy 每日签到 - 便携版使用说明

这是一个打包好的独立版本,不依赖 Python,可直接在任意 Windows 电脑上运行。

## 文件说明

| 文件 | 作用 |
|------|------|
| `WorkBuddyCheckIn.exe` | 签到主程序(独立运行,无需安装 Python) |
| `checkin_config.json` | 配置文件(含账号 Token,见下方说明) |
| `run_checkin.bat` | 双击运行签到(运行后窗口停留,方便查看结果) |
| `setup_task.bat` | 一键注册每天 09:00 自动签到(需管理员权限) |

## 使用方法

### 方式一:手动签到
双击 `run_checkin.bat`,看到 `[SUCCESS] 签到成功!` 即完成。

### 方式二:每天自动签到(推荐)
1. 右键 `setup_task.bat` → **以管理员身份运行**
2. 看到 `[OK] Scheduled task created successfully` 即注册成功
3. 之后每天 09:00 系统会自动运行签到,结果记录在同目录 `checkin.log`

## 配置说明

`checkin_config.json` 内容:

```json
{
  "base_url": "https://copilot.tencent.com",
  "uid": "你的账号UID",
  "token": "你的登录Token"
}
```

- **Token 有有效期**:如果签到时报错(如 401/403 或活动过期),需要重新获取 Token
- **获取方法**:在 WorkBuddy/CodeBuddy 客户端登录后,通过抓包工具(Fiddler/Charles)抓取 `daily-checkin` 请求中的 `Authorization: Bearer xxx` 内容
- **换电脑使用**:直接复制整个文件夹到其他电脑即可,无需重新配置(同一账号)

## 常见输出

| 输出 | 含义 |
|------|------|
| `[SUCCESS] 签到成功! +100积分, 连续N天` | 签到成功 |
| `[OK] 今天已签到 (连续N天, 累计X积分)` | 今天已经签过,无需重复 |
| `[ERROR] 签到失败` | 检查 Token 是否过期或网络是否正常 |

## 注意事项

- ⚠️ `checkin_config.json` 含个人 Token,请勿随意分享给他人
- 本工具仅供个人学习使用
- 如 WorkBuddy 签到规则变化,程序可能需要更新

## 云端自动签到（GitHub Actions）

把仓库推到 GitHub 后,可用 Actions 在云端每天自动签到,无需本机开机。

### 配置 Secret
1. 仓库 `Settings` → `Secrets and variables` → `Actions` → `New repository secret`
2. Name 填 `CHECKIN_CONFIG`
3. Secret 内容填你本地 `checkin_config.json` 的**完整 JSON**(含 token)

### 运行
- 推送后,工作流 `WorkBuddy 每日签到` 会按 cron `30 2 * * *`(即北京时间每天 10:30)自动运行
- 也可在 `Actions` 页面手动 `Run workflow` 立即测试
- 签到结果会显示在 Actions 日志中

### 注意事项
- GitHub 计划任务可能延迟几分钟到几十分钟,不影响"当天签到"
- Token 有有效期,过期后更新 `CHECKIN_CONFIG` 这个 Secret 即可
- 公开仓库的 Secret 仅仓库协作者可见,不会出现在日志或代码中
- 本工具仅供个人学习使用,自动化平台签到请自行评估相关服务条款
