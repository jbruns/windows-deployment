$RuleGroups = @(
	"File and Printer Sharing",
	"Performance Logs and Alerts",
	"Remote Event Log Management",
	"Remote Event Monitor",
	"Remote Scheduled Tasks Management",
	"Remote Service Management",
	"Remote Shutdown",
	"Remote Volume Management",
	"Virtual Machine Monitoring",
	"Windows Management Instrumentation (WMI)",
	"Windows Remote Management",
	"Windows Remote Management (Compatibility)"
)
Foreach ($RuleGroup in $RuleGroups) {
	Set-NetFirewallRule -DisplayGroup $RuleGroup -Enabled True -Profile Domain
}