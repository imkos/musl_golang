## musl  Compile image for Golang



### 目标

golang项目静态cgo编译工具



### 工具链

musl:  https://musl.libc.org

musl static cross- and native- *musl-based* toolchains:  https://musl.cc

alpine linux: https://www.alpinelinux.org



### cgo跨平台编译

musl 有static的libc, 非常适合Golang语言的cgo的静态编译

musl 有跨平台的交叉编译完整工具链

alpine linux 小巧, 纯静态实现libc. 基于musl libc的linux.

golang build base alpine linux:

```
go build -tags netgo .
```



### 名词附录

Alpine Linux:  Alpine Linux is a security-oriented, lightweight Linux distribution based on musl libc and busybox.



