/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20260408 (64-bit version)
 * Copyright (c) 2000 - 2026 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of /Users/barkysagara/Desktop/sTime/AML/SSDT-dGPU-Off-rB3551.aml
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000117 (279)
 *     Revision         0x02
 *     Checksum         0xB6
 *     OEM ID           "rBADAK"
 *     OEM Table ID     "dGPU-Off"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("", "SSDT", 2, "rBADAK", "dGPU-Off", 0x00000000)
{
    External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP._OFF, MethodObj)    // 0 Arguments

    Scope (\_SB.PCI0.PEG0.PEGP)
    {
        Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
        {
            If (_OSI ("Darwin")){}
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }

            Return (0x0F)
        }
    }

    Device (RMD1)
    {
        Name (_HID, "RMD10000")  // _HID: Hardware ID
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0F)
            }

            Return (Zero)
        }

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If (_OSI ("Darwin"))
            {
                If (CondRefOf (\_SB.PCI0.PEG0.PEGP._OFF))
                {
                    \_SB.PCI0.PEG0.PEGP._OFF ()
                }
            }
        }
    }
}

