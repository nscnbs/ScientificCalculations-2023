// Autor: Illia Azler 239537

#include <stdio.h>
#include <float.h>

int main()
{
    printf("Float16 Macheps (C float.h): %e\n", FLT_EPSILON);
    printf("Float32 Macheps (C float.h): %e\n", DBL_EPSILON);
    printf("Float64 Macheps (C float.h): %Le\n", LDBL_EPSILON);
    printf("Float16 Max (C float.h): %e\n", FLT_MAX);
    printf("Float32 Max (C float.h): %e\n", DBL_MAX);
    printf("Float64 Max (standart IEEE 754): 1.18973e+4932\n", LDBL_MAX);

    return 0;
}
