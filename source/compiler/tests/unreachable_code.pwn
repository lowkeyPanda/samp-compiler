#include <core>
#include <console>

new g_var = 0;

test_if_1()
{
	if (g_var != 0)
		return 0;
	else
		return 1;
	return 2; // warning 225: unreachable code
}

test_if_2()
{
	new i = 0;
	while (i < 10)
	{
		if (g_var != 0)
			return;
		else
			continue;
		i++; // warning 225: unreachable code
	}
}

test_switch_1()
{
	switch (g_var)
	{
		case 0:
			return 0;
		case 1:
			return 1;
		default:
			return 2;
	}
	return 3; // warning 225: unreachable code
}

test_switch_2()
{
	new i = 0;
	while (i < 10)
	{
		switch (g_var)
		{
			case 0:
				break;
			default:
				continue;
		}
		i++; // warning 225: unreachable code
	}
	return i;
}

test_switch_3()
{
	switch (g_var)
	{
		case 0:
			return 0;
		case 1:
			return 1;
	}
	// shouldn't cause warning 225 ("unreachable code")
	return 2;
}

main()
{
	test_if_1();
	test_if_2();
	test_switch_1();
	test_switch_2();
	test_switch_3();
}
