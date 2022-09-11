#include <rtthread.h>

#include <math.h>
#include <string.h>

// Code from: https://gist.github.com/gszauer/5718433
#define MAX_CIRCLE_ANGLE         512
#define HALF_MAX_CIRCLE_ANGLE    (MAX_CIRCLE_ANGLE / 2)
#define QUARTER_MAX_CIRCLE_ANGLE (MAX_CIRCLE_ANGLE / 4)
#define MASK_MAX_CIRCLE_ANGLE    (MAX_CIRCLE_ANGLE - 1)
#define PI                       3.14159265358979323846f

static float fast_cossin_table[MAX_CIRCLE_ANGLE]; // Declare table of fast cosinus and sinus

// Copied from NVidia web site
static inline void FloatToInt(int *int_pointer, float f)
{
    *int_pointer = f;
}

static inline float fastcos(float n)
{
    float f = n * HALF_MAX_CIRCLE_ANGLE / PI;
    int i;
    FloatToInt(&i, f);
    if (i < 0)
        return fast_cossin_table[((-i) + QUARTER_MAX_CIRCLE_ANGLE) & MASK_MAX_CIRCLE_ANGLE];
    else
        return fast_cossin_table[(i + QUARTER_MAX_CIRCLE_ANGLE) & MASK_MAX_CIRCLE_ANGLE];
}

static inline float fastsin(float n)
{
    float f = n * HALF_MAX_CIRCLE_ANGLE / PI;
    int i;
    FloatToInt(&i, f);
    if (i < 0)
        return fast_cossin_table[(-((-i) & MASK_MAX_CIRCLE_ANGLE)) + MAX_CIRCLE_ANGLE];
    else
        return fast_cossin_table[i & MASK_MAX_CIRCLE_ANGLE];
}

static void fastsincos_build()
{
    for (int i = 0; i < MAX_CIRCLE_ANGLE; i++)
        fast_cossin_table[i] = (float)sinf((float)i * ((float)(PI / HALF_MAX_CIRCLE_ANGLE)));
}

__attribute__((optimize(3))) int donut(void)
{
    static float z[1760];
    static char b[1760];
    rt_kprintf("\x1b[2J");
    fastsincos_build();
    for (float A = 0, B = 0;;) {
        memset(b, 32, 1760);
        memset(z, 0, 7040);
        for (float j = 0; 6.28f > j; j += 0.07f) {
            for (float i = 0.0f; 6.28f > i; i += 0.02f) {
                float sini = fastsin(i),
                      cosj = fastcos(j),
                      sinA = fastsin(A),
                      sinj = fastsin(j),
                      cosA = fastcos(A),
                      cosj2 = cosj + 2,
                      mess = 1.0f / (sini * cosj2 * sinA + sinj * cosA + 5),
                      cosi = fastcos(i),
                      cosB = fastcos(B),
                      sinB = fastsin(B),
                      t = sini * cosj2 * cosA - sinj * sinA;
                int x = 40 + 30 * mess * (cosi * cosj2 * cosB - t * sinB),
                    y = 12 + 15 * mess * (cosi * cosj2 * sinB + t * cosB),
                    o = x + 80 * y,
                    N = 8 * ((sinj * sinA - sini * cosj * cosA) * cosB - sini * cosj * sinA - sinj * cosA - cosi * cosj * sinB);
                if (22 > y && y > 0 && x > 0 && 80 > x && mess > z[o]) {
                    z[o] = mess;
                    b[o] = ".,-~:;=!*#$@"[N > 0 ? N : 0];
                }
            }
        }
        rt_kprintf("\x1b[d");
        for (int k = 0; 1761 > k; k++)
            rt_kprintf("%c", k % 80 ? b[k] : 10);
        A += 0.04f;
        B += 0.02f;
    }
    return 0;
}

MSH_CMD_EXPORT(donut, show a donut);
