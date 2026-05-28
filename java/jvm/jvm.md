# JVM

```mermaid
flowchart LR
    A["JVM"]
    A-->|全称|A1("Java Virtual Machine")
    A-->|特点|A2[["与编程语言和操作系统无关，有自己的指令集和运行时内存区域"]]
    A-->|特点|A3[["只识别一种特点的二进制格式文件：类文件（.class）"]]
    A3-->A31>"机器指令（Instructions/Bytecodes）"]
    A3-->A32>"符号表（Symbol table）"]
    A3-->A33>"其他辅助信息（other ancillary information）"]
```
