#!/system/bin/sh

target=`getprop ro.board.platform`

case "$target" in
    "msm8660" | "msm8660_csfb")
	    echo 1 > /sys/module/rpm_resources/enable_low_power/L2_cache
        echo 1 > /sys/module/rpm_resources/enable_low_power/pxo
        echo 2 > /sys/module/rpm_resources/enable_low_power/vdd_dig
	    echo 2 > /sys/module/rpm_resources/enable_low_power/vdd_mem
        echo 1 > /sys/module/rpm_resources/enable_low_power/rpm_cpu
        echo 1 > /sys/module/pm_8x60/modes/cpu0/power_collapse/suspend_enabled
        echo 1 > /sys/module/pm_8x60/modes/cpu1/power_collapse/suspend_enabled
        echo 1 > /sys/module/pm_8x60/modes/cpu0/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/pm_8x60/modes/cpu1/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/pm_8x60/modes/cpu0/power_collapse/idle_enabled
        echo 1 > /sys/module/pm_8x60/modes/cpu1/power_collapse/idle_enabled
        echo 1 > /sys/module/pm_8x60/modes/cpu0/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/pm_8x60/modes/cpu1/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/pm_8660/modes/cpu0/power_collapse/suspend_enabled
        echo 1 > /sys/module/pm_8660/modes/cpu1/power_collapse/suspend_enabled
        echo 1 > /sys/module/pm_8660/modes/cpu0/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/pm_8660/modes/cpu1/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/pm_8660/modes/cpu0/power_collapse/idle_enabled
        echo 1 > /sys/module/pm_8660/modes/cpu1/power_collapse/idle_enabled
        echo 1 > /sys/module/pm_8660/modes/cpu0/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/pm_8660/modes/cpu1/standalone_power_collapse/idle_enabled
        echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
        echo "ondemand" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
        echo 50000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
        echo 90 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
        echo 1 > /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
        echo 4 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
        echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        echo 384000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
        chown system /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
        chown system /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        chown system /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
        chown system /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
        chown root.system /sys/devices/system/cpu/mfreq
        chmod 220 /sys/devices/system/cpu/mfreq
        chown root.system /sys/devices/system/cpu/cpu1/online
        chmod 664 /sys/devices/system/cpu/cpu1/online
        # Allow PowerManagerService to acquire perflock and enable perf mode
        chown system /sys/power/perflock
     ;;
esac

chown system /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate

emmc_boot=`getprop ro.emmc`
case "$emmc_boot"
    in "1")
        chown system /sys/devices/platform/rs300000a7.65536/force_sync
        chown system /sys/devices/platform/rs300000a7.65536/sync_sts
        chown system /sys/devices/platform/rs300100a7.65536/force_sync
        chown system /sys/devices/platform/rs300100a7.65536/sync_sts
    ;;
esac

# Post-setup services
case "$target" in
    "msm8660" | "msm8660_csfb" | "msm8960")
        start mpdecision
	;;
esac

case "$target" in
    "msm8660" | "msm8660_csfb")
        start thermald
    ;;
esac