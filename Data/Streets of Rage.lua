ROMHashes =
{
    SOR1 = "569CFEC15813294A8F0CF88CCCC8C151",
    SOR2 = "CB75D5A6919B61EFE917BEA5762C1CB7",
    SOR3 = "2D0B0C8F10EDF76131708E874E8D1EE4"
}

Address = 
{
    [ROMHashes.SOR1] =
    {
        Health = 0xB832,
        Lives = 0xFF20,
        Special = 0xFF21,
        Timer = 0xFB59
    },
    
    [ROMHashes.SOR2] =
    {
        Health = 0xEF81,
        Lives = 0xEF83,
        Timer = 0xFC3D
    },
    
    [ROMHashes.SOR3] =
    {
        Health = 0xDF6C,
        Lives = 0xDF8B,
        Special = 0xF617
    },
}

Max =
{
    Health =
    {
        [ROMHashes.SOR1] = 80,
        [ROMHashes.SOR2] = 104,
        [ROMHashes.SOR3] = 52
    }    
}
