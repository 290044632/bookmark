# MCP

---

> 全称：模型上下文协议（`Model Context Protocol`），一种有状态协议（Stateful Protocol）

> 作用：一种AI应用连接外部系统的开源标准

---

```mermaid
flowchart LR

A["AI Application"]
B("MCP")
C[["External Systems"]]

A<-->B<-->C
```

## Scope(范围)

```mermaid
flowchart LR
A["SCOPE"]

A-->A1("MCP Specification,（MCP规范）")-->A11>"描述了实现客户端和服务器必要规则"]
A-->A2("MCP SDKS")-->A21>"不同编程语言的MCP实现"]
A-->A3("MCP Development Tools")-->A31>"实现MCP服务器和客户端的工具"]
A-->A4("MCP Reference Server Implementations")-->A41>"MCP服务器实现参考"]
```

## Concepts(概念)

```mermaid
flowchart LR
A["Concepts"]
A-->A1("Participants（参与者）")
A-->A2("Layer（层）")
```

### Participants(参与者)

```mermaid
flowchart LR

A["Participants"]
A-->A1("MCP Host")-->A11>"协调和管理一个或多个MCP客户端的AI应用程序"]
A-->A2("MCP Client")-->A21>"维护与MCP服务器的连接，
并从MCP服务器获取上下文以供MCP主机使用的组件"]
A-->A3("MCP Server")
A3-->|"STDIO transport"|A31{{"Local  MCP Server"}}
A3-->|"Streamable HTTP transport"|A32{{"Remote MCP Server"}}
A31-->A311>"为MCP客户端提供上下文的程序"]
A32-->A311
```

- 三者的关系可以如下表示：

```mermaid
flowchart TB
  subgraph A["MCP Host(AI Application)"]
   B1("MCP Client1")
   B2("MCP Client2")
   B3("MCP Client3")
   B4("MCP Client4")
  end
  C1{{"Local MCP Server"}}
  C2{{"Local MCP Server"}}
  C3{{"Remote MCP Server"}}
B1-->|"Dedicated connection
STDIO transport"|C1
B2-->|"Dedicated connection
STDIO transport
"|C2
B3-->|"Dedicated  connection
Streamable HTTP"|C3
B4-->|"Dedicated connection
Streamable HTTP"|C3
```

### Layer(层)

```mermaid
flowchart LR

A["Layer"]

A-->A1("Data Layer")-->A11>"定义了基于 JSON-RPC 的客户端-服务器通信协议，
包括生命周期管理和核心原语，例如工具、资源、提示和通知"]

A-->A2("Transport Layer")-->21>"定义了客户端和服务器之间进行数据交换的通信机制和通道，
包括特定于传输的连接建立、消息帧和授权。"]
```

#### Data Layer(数据层)

```mermaid
flowchart LR

A["Data layer"]

A-->A1("Lifecycle management（生命周期管理）")
A1-->A11>"负责客户端与服务端之间的连接初始化、能力协商、连接终止"]

A-->A2("Server features（服务器功能）")
A2-->21>"使服务器能够提供核心功能，
包括用于AI操作的工具、上下文数据资源以及来自客户端和与客户端交互的模板提示词"]

A-->A3("Client features（客户端功能）")
A3-->A31>"使服务器能够请求客户端从主机LLM进行采样、获取用户输入并将消息记录到客户端"]

A-->A4("Utility features（实用功能）")
A4-->A41>"支持其他额外功能，例如实时更新通知和长时间运行操作的进度跟踪"]
```

#### Data Layer Protocol(数据层协议)

```mermaid
flowchart LR
A["Data Layer Protocol"]

A-->A1{{"Lifecycle management（生命周期管理）"}}
A-->A2{{"Primitives（原语）"}}
A-->A3{{"Notifications（通知）"}}
```

```mermaid
flowchart LR

A["Primitives（原语）"]
A-->|作用|A1>"它们定义了客户端和服务器可以相互提供哪些服务；
这些基本单元规定了可以与人工智能应用程序共享的上下文信息类型以及可以执行的操作范围。
"]

A-->A2{{"MCP Server"}}
A2-->A21("Tools（工具）")-->A211>"AI应用程序可以调用以执行操作
（例如，文件操作、API调用、数据库查询）的可执行函数"]
A2-->A22("Resources（资源）")-->A221>"为人工智能应用提供上下文信息的数据源
（例如，文件内容、数据库记录、API响应）"]
A2-->A23("Prompts（提示词）")-->A231>"可重用的模板，有助于构建与语言模型的交互
（例如，系统提示、少样本示例）"]

A-->A3{{"MCP Client"}}
A3-->A31("Sampling（采样）")-->A311>"允许服务器向客户端的AI应用程序请求语言模型补全"]
A3-->A32("Elicitation（获取）")-->A321>"允许服务器向用户请求额外信息"]
A3-->A33("Logging（日志）")-->A331>"允许服务器向客户端发送日志消息，以便进行调试和监控"]

A-->A4{{"Tasks（任务）"}}-->A41>"持久执行包装器，
可对MCP请求（例如，昂贵的计算、工作流自动化、批量处理、多步骤操作）进行延迟结果检索和状态跟踪"]
```

#### Transport Layer(传输层)

```mermaid
flowchart LR

A["Transport Layer"]

A-->A1("Stdio transport")
A-->A2("Streamable transport")
A2-->|Blocking|A21{{"HTTP Post"}}
A2-->|Streaming|A22{{"SSE"}}
```
