# Swift Compiler Crash

```bash
$ swift run
```

# Backtrace

```
Building for debugging...
error: compile command failed due to signal 6 (use -v to see invocation)
Assertion failed: (p.isTrackingElement(op.getOpArgs()[0]) && "Require PartitionOp's argument should already be tracked"), function apply, file PartitionUtils.h, line 1385.
Please submit a bug report (https://swift.org/contributing/#reporting-bugs) and include the crash backtrace.
Stack dump:
0.      Program arguments: /Users/piotr/Library/Developer/Toolchains/swift-6.1-RELEASE.xctoolchain/usr/bin/swift-frontend -frontend -c -primary-file /Users/piotr/Work/GitHub/UnmanagedCrash/Sources/main.swift -emit-dependencies-path /Users/piotr/Work/GitHub/UnmanagedCrash/.build/arm64-apple-macosx/debug/UnmanagedCrash.build/main.d -emit-reference-dependencies-path /Users/piotr/Work/GitHub/UnmanagedCrash/.build/arm64-apple-macosx/debug/UnmanagedCrash.build/main.swiftdeps -target arm64-apple-macosx10.13 -Xllvm -aarch64-use-tbi -enable-objc-interop -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX15.4.sdk -I /Users/piotr/Work/GitHub/UnmanagedCrash/.build/arm64-apple-macosx/debug/Modules -I /Users/piotr/Library/Developer/Toolchains/swift-6.1-RELEASE.xctoolchain/usr/lib/swift/macosx/testing -I /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/usr/lib -F /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Frameworks -F /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/PrivateFrameworks -color-diagnostics -enable-testing -g -debug-info-format=dwarf -dwarf-version=4 -module-cache-path /Users/piotr/Work/GitHub/UnmanagedCrash/.build/arm64-apple-macosx/debug/ModuleCache -swift-version 6 -Onone -D SWIFT_PACKAGE -D DEBUG -entry-point-function-name UnmanagedCrash_main -empty-abi-descriptor -plugin-path /Users/piotr/Library/Developer/Toolchains/swift-6.1-RELEASE.xctoolchain/usr/lib/swift/host/plugins/testing -resource-dir /Users/piotr/Library/Developer/Toolchains/swift-6.1-RELEASE.xctoolchain/usr/lib/swift -enable-anonymous-context-mangled-names -file-compilation-dir /Users/piotr/Work/GitHub/UnmanagedCrash -Xcc -fmodule-map-file=/Users/piotr/Work/GitHub/UnmanagedCrash/ThirdParty/include/module.modulemap -Xcc -I -Xcc /Users/piotr/Work/GitHub/UnmanagedCrash/ThirdParty/include -Xcc -isysroot -Xcc /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX15.4.sdk -Xcc -F -Xcc /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Frameworks -Xcc -F -Xcc /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/PrivateFrameworks -Xcc -fPIC -Xcc -g -module-name UnmanagedCrash -package-name unmanagedcrash -in-process-plugin-server-path /Users/piotr/Library/Developer/Toolchains/swift-6.1-RELEASE.xctoolchain/usr/lib/swift/host/libSwiftInProcPluginServer.dylib -plugin-path /Users/piotr/Library/Developer/Toolchains/swift-6.1-RELEASE.xctoolchain/usr/lib/swift/host/plugins -plugin-path /Users/piotr/Library/Developer/Toolchains/swift-6.1-RELEASE.xctoolchain/usr/local/lib/swift/host/plugins -target-sdk-version 15.4 -target-sdk-name macosx15.4 -external-plugin-path /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/usr/lib/swift/host/plugins#/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/usr/bin/swift-plugin-server -external-plugin-path /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/usr/local/lib/swift/host/plugins#/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/usr/bin/swift-plugin-server -o /Users/piotr/Work/GitHub/UnmanagedCrash/.build/arm64-apple-macosx/debug/UnmanagedCrash.build/main.swift.o -index-store-path /Users/piotr/Work/GitHub/UnmanagedCrash/.build/arm64-apple-macosx/debug/index/store -index-system-modules
1.      Apple Swift version 6.1 (swift-6.1-RELEASE)
2.      Compiling with the current language version
3.      While evaluating request ExecuteSILPipelineRequest(Run pipelines { Mandatory Diagnostic Passes + Enabling Optimization Passes } on SIL for UnmanagedCrash)
4.      While running pass #228 SILFunctionTransform "SendNonSendable" on SILFunction "@$s14UnmanagedCrash14registerSystem3ecs6systemys13OpaquePointerV_xtAA0D0RzlF".
 for 'registerSystem(ecs:system:)' (at /Users/piotr/Work/GitHub/UnmanagedCrash/Sources/main.swift:17:1)
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
0  swift-frontend           0x000000010836b884 llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) + 56
1  swift-frontend           0x0000000108369fb0 llvm::sys::RunSignalHandlers() + 112
2  swift-frontend           0x000000010836bec8 SignalHandler(int) + 292
3  libsystem_platform.dylib 0x00000001993d4624 _sigtramp + 56
4  libsystem_pthread.dylib  0x000000019939a88c pthread_kill + 296
5  libsystem_c.dylib        0x00000001992a3c60 abort + 124
6  libsystem_c.dylib        0x00000001992a2eec err + 0
7  swift-frontend           0x0000000108427408 swift::regionanalysisimpl::BlockPartitionState::recomputeExitFromEntry(swift::regionanalysisimpl::PartitionOpTranslator&) (.cold.48) + 0
8  swift-frontend           0x0000000103785b60 swift::regionanalysisimpl::BlockPartitionState::recomputeExitFromEntry(swift::regionanalysisimpl::PartitionOpTranslator&) + 4980
9  swift-frontend           0x0000000103786870 swift::RegionAnalysisFunctionInfo::runDataflow() + 1716
10 swift-frontend           0x0000000103786170 swift::RegionAnalysisFunctionInfo::RegionAnalysisFunctionInfo(swift::SILFunction*, swift::PostOrderFunctionInfo*) + 992
11 swift-frontend           0x0000000103787308 swift::RegionAnalysis::newFunctionAnalysis(swift::SILFunction*) + 56
12 swift-frontend           0x00000001039be590 swift::FunctionAnalysisBase<swift::RegionAnalysisFunctionInfo>::get(swift::SILFunction*) + 80
13 swift-frontend           0x00000001039bcb4c (anonymous namespace)::SendNonSendable::run() + 140
14 swift-frontend           0x00000001039df054 swift::SILPassManager::runPassOnFunction(unsigned int, swift::SILFunction*) + 1452
15 swift-frontend           0x00000001039dfdd8 swift::SILPassManager::runFunctionPasses(unsigned int, unsigned int) + 1060
16 swift-frontend           0x00000001039e250c swift::SILPassManager::execute() + 596
17 swift-frontend           0x00000001039dcfd0 swift::SILPassManager::executePassPipelinePlan(swift::SILPassPipelinePlan const&) + 72
18 swift-frontend           0x00000001039dcf50 swift::ExecuteSILPipelineRequest::evaluate(swift::Evaluator&, swift::SILPipelineExecutionDescriptor) const + 68
19 swift-frontend           0x0000000103a28d90 swift::SimpleRequest<swift::ExecuteSILPipelineRequest, std::__1::tuple<> (swift::SILPipelineExecutionDescriptor), (swift::RequestFlags)1>::evaluateRequest(swift::ExecuteSILPipelineRequest const&, swift::Evaluator&) + 28
20 swift-frontend           0x00000001039f9154 swift::ExecuteSILPipelineRequest::OutputType swift::Evaluator::getResultUncached<swift::ExecuteSILPipelineRequest, swift::ExecuteSILPipelineRequest::OutputType swift::evaluateOrFatal<swift::ExecuteSILPipelineRequest>(swift::Evaluator&, swift::ExecuteSILPipelineRequest)::'lambda'()>(swift::ExecuteSILPipelineRequest const&, swift::ExecuteSILPipelineRequest::OutputType swift::evaluateOrFatal<swift::ExecuteSILPipelineRequest>(swift::Evaluator&, swift::ExecuteSILPipelineRequest)::'lambda'()) + 204
21 swift-frontend           0x00000001039dd1c0 swift::executePassPipelinePlan(swift::SILModule*, swift::SILPassPipelinePlan const&, bool, swift::irgen::IRGenModule*) + 64
22 swift-frontend           0x0000000103a0bef8 swift::runSILDiagnosticPasses(swift::SILModule&) + 192
23 swift-frontend           0x00000001032b0758 swift::CompilerInstance::performSILProcessing(swift::SILModule*) + 80
24 swift-frontend           0x000000010307d3ac performCompileStepsPostSILGen(swift::CompilerInstance&, std::__1::unique_ptr<swift::SILModule, std::__1::default_delete<swift::SILModule>>, llvm::PointerUnion<swift::ModuleDecl*, swift::SourceFile*>, swift::PrimarySpecificPaths const&, int&, swift::FrontendObserver*) + 820
25 swift-frontend           0x000000010307ca3c swift::performCompileStepsPostSema(swift::CompilerInstance&, int&, swift::FrontendObserver*) + 468
26 swift-frontend           0x0000000103088b50 withSemanticAnalysis(swift::CompilerInstance&, swift::FrontendObserver*, llvm::function_ref<bool (swift::CompilerInstance&)>, bool) + 164
27 swift-frontend           0x000000010307e74c performCompile(swift::CompilerInstance&, int&, swift::FrontendObserver*) + 716
28 swift-frontend           0x000000010307df68 swift::performFrontend(llvm::ArrayRef<char const*>, char const*, void*, swift::FrontendObserver*) + 2228
29 swift-frontend           0x0000000102e618f0 swift::mainEntry(int, char const**) + 3064
30 dyld                     0x0000000198ffab98 start + 6076
```
