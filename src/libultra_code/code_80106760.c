#include <ultra64.h>
#include <global.h>

// Note: This is part of libultra

u32* func_80106760()
{
    register u32 sMask = __osDisableInt();
    u32 var1;
    
    var1 = D_8000AF00[0x04 / 4];

    func_800072F0(sMask);

    return var1;
}