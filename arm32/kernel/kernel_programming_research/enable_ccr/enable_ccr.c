#include <linux/module.h>
#include <linux/kernel.h>

MODULE_LICENSE("GPL");
MODULE_INFO(intree, "Y");

void enable_ccr(void *info)
{
	asm volatile ("mcr p15, 0, %0, c9, c14, 0" :: "r"(1));
	asm volatile ("mcr p15, 0, %0, c9, c12, 0\t\n" :: "r"(1));
	asm volatile ("mcr p15, 0, %0, c9, c12, 1\t\n" :: "r"(0x80000000));
}

int init_module()
{
	on_each_cpu(enable_ccr,0, 0);
	printk(KERN_INFO "Userspace access to CCR enabled\n");
	return 0;
}

void cleanup_module()
{
	printk(KERN_INFO "Userspace access to CCR disabled\n");
}
