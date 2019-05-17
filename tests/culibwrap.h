#ifndef _CULIBWRAP_H_
#define _CULIBWRAP_H_

typedef enum cu_api_fun {
cuapi_cuInit,
cuapi_cuDeviceGet,
cuapi_cuDeviceGetCount,
cuapi_cuDeviceGetName,
cuapi_cuDeviceTotalMem_v2,
cuapi_cuDeviceGetAttribute,
cuapi_cuDeviceGetP2PAttribute,
cuapi_cuDriverGetVersion,
cuapi_cuDeviceGetByPCIBusId,
cuapi_cuDeviceGetPCIBusId,
cuapi_cuDeviceGetUuid,
cuapi_cuDeviceGetLuid,
cuapi_cuDeviceGetProperties,
cuapi_cuDevicePrimaryCtxRetain,
cuapi_cuDevicePrimaryCtxRelease,
cuapi_cuDevicePrimaryCtxSetFlags,
cuapi_cuDevicePrimaryCtxGetState,
cuapi_cuDevicePrimaryCtxReset,
cuapi_cuCtxCreate_v2,
cuapi_cuCtxGetFlags,
cuapi_cuCtxSetCurrent,
cuapi_cuCtxGetCurrent,
cuapi_cuCtxDetach,
cuapi_cuCtxGetApiVersion,
cuapi_cuCtxGetDevice,
cuapi_cuCtxGetLimit,
cuapi_cuCtxSetLimit,
cuapi_cuCtxGetCacheConfig,
cuapi_cuCtxSetCacheConfig,
cuapi_cuCtxGetSharedMemConfig,
cuapi_cuCtxGetStreamPriorityRange,
cuapi_cuCtxSetSharedMemConfig,
cuapi_cuCtxSynchronize,
cuapi_cuModuleLoad,
cuapi_cuModuleLoadData,
cuapi_cuModuleLoadDataEx,
cuapi_cuModuleLoadFatBinary,
cuapi_cuModuleUnload,
cuapi_cuModuleGetFunction,
cuapi_cuModuleGetGlobal_v2,
cuapi_cuModuleGetTexRef,
cuapi_cuModuleGetSurfRef,
cuapi_cuLinkCreate,
cuapi_cuLinkAddData,
cuapi_cuLinkAddFile,
cuapi_cuLinkComplete,
cuapi_cuLinkDestroy,
cuapi_cuMemGetInfo_v2,
cuapi_cuMemAllocManaged,
cuapi_cuMemAlloc_v2,
cuapi_cuMemAllocPitch_v2,
cuapi_cuMemFree_v2,
cuapi_cuMemGetAddressRange_v2,
cuapi_cuMemFreeHost,
cuapi_cuMemHostAlloc,
cuapi_cuMemHostGetDevicePointer_v2,
cuapi_cuMemHostGetFlags,
cuapi_cuMemHostRegister_v2,
cuapi_cuMemHostUnregister,
cuapi_cuPointerGetAttribute,
cuapi_cuPointerGetAttributes,
cuapi_cuMemcpy,
cuapi_cuMemcpy_ptds,
cuapi_cuMemcpyAsync,
cuapi_cuMemcpyAsync_ptsz,
cuapi_cuMemcpyPeer,
cuapi_cuMemcpyPeer_ptds,
cuapi_cuMemcpyPeerAsync,
cuapi_cuMemcpyPeerAsync_ptsz,
cuapi_cuMemcpyHtoD_v2,
cuapi_cuMemcpyHtoD_v2_ptds,
cuapi_cuMemcpyHtoDAsync_v2,
cuapi_cuMemcpyHtoDAsync_v2_ptsz,
cuapi_cuMemcpyDtoH_v2,
cuapi_cuMemcpyDtoH_v2_ptds,
cuapi_cuMemcpyDtoHAsync_v2,
cuapi_cuMemcpyDtoHAsync_v2_ptsz,
cuapi_cuMemcpyDtoD_v2,
cuapi_cuMemcpyDtoD_v2_ptds,
cuapi_cuMemcpyDtoDAsync_v2,
cuapi_cuMemcpyDtoDAsync_v2_ptsz,
cuapi_cuMemcpyDtoA_v2,
cuapi_cuMemcpyAtoD_v2,
cuapi_cuMemcpyHtoA_v2,
cuapi_cuMemcpyHtoAAsync_v2,
cuapi_cuMemcpyAtoH_v2,
cuapi_cuMemcpyAtoHAsync_v2,
cuapi_cuMemcpyAtoA_v2,
cuapi_cuMemcpy2DUnaligned_v2,
cuapi_cuMemcpy2DUnaligned_v2_ptds,
cuapi_cuMemcpy2DAsync_v2,
cuapi_cuMemcpy2DAsync_v2_ptsz,
cuapi_cuMemcpy3D_v2,
cuapi_cuMemcpy2D_v2,
cuapi_cuMemcpy3D_v2_ptds,
cuapi_cuMemcpy3DAsync_v2,
cuapi_cuMemcpy3DAsync_v2_ptsz,
cuapi_cuMemcpy3DPeer,
cuapi_cuMemcpy3DPeer_ptds,
cuapi_cuMemcpy3DPeerAsync,
cuapi_cuMemcpy3DPeerAsync_ptsz,
cuapi_cuMemsetD8_v2,
cuapi_cuMemsetD8_v2_ptds,
cuapi_cuMemsetD8Async,
cuapi_cuMemsetD8Async_ptsz,
cuapi_cuMemsetD2D8_v2,
cuapi_cuMemsetD2D8_v2_ptds,
cuapi_cuMemsetD2D8Async,
cuapi_cuMemsetD2D8Async_ptsz,
cuapi_cuFuncSetCacheConfig,
cuapi_cuFuncSetSharedMemConfig,
cuapi_cuFuncGetAttribute,
cuapi_cuFuncSetAttribute,
cuapi_cuArrayCreate_v2,
cuapi_cuArrayGetDescriptor_v2,
cuapi_cuArray3DCreate_v2,
cuapi_cuArray3DGetDescriptor_v2,
cuapi_cuArrayDestroy,
cuapi_cuMipmappedArrayCreate,
cuapi_cuMipmappedArrayGetLevel,
cuapi_cuMipmappedArrayDestroy,
cuapi_cuTexRefCreate,
cuapi_cuTexRefDestroy,
cuapi_cuTexRefSetArray,
cuapi_cuTexRefSetMipmappedArray,
cuapi_cuTexRefSetAddress_v2,
cuapi_cuTexRefSetAddress2D_v3,
cuapi_cuTexRefSetFormat,
cuapi_cuTexRefSetAddressMode,
cuapi_cuTexRefSetFilterMode,
cuapi_cuTexRefSetMipmapFilterMode,
cuapi_cuTexRefSetMipmapLevelBias,
cuapi_cuTexRefSetMipmapLevelClamp,
cuapi_cuTexRefSetMaxAnisotropy,
cuapi_cuTexRefSetFlags,
cuapi_cuTexRefSetBorderColor,
cuapi_cuTexRefGetBorderColor,
cuapi_cuSurfRefSetArray,
cuapi_cuTexObjectCreate,
cuapi_cuTexObjectDestroy,
cuapi_cuTexObjectGetResourceDesc,
cuapi_cuTexObjectGetTextureDesc,
cuapi_cuTexObjectGetResourceViewDesc,
cuapi_cuSurfObjectCreate,
cuapi_cuSurfObjectDestroy,
cuapi_cuSurfObjectGetResourceDesc,
cuapi_cuImportExternalMemory,
cuapi_cuExternalMemoryGetMappedBuffer,
cuapi_cuExternalMemoryGetMappedMipmappedArray,
cuapi_cuDestroyExternalMemory,
cuapi_cuImportExternalSemaphore,
cuapi_cuSignalExternalSemaphoresAsync,
cuapi_cuSignalExternalSemaphoresAsync_ptsz,
cuapi_cuWaitExternalSemaphoresAsync,
cuapi_cuWaitExternalSemaphoresAsync_ptsz,
cuapi_cuDestroyExternalSemaphore,
cuapi_cuLaunchKernel,
cuapi_cuLaunchKernel_ptsz,
cuapi_cuLaunchCooperativeKernel,
cuapi_cuLaunchCooperativeKernel_ptsz,
cuapi_cuLaunchCooperativeKernelMultiDevice,
cuapi_cuLaunchHostFunc,
cuapi_cuLaunchHostFunc_ptsz,
cuapi_cuEventCreate,
cuapi_cuEventRecord,
cuapi_cuEventRecord_ptsz,
cuapi_cuEventQuery,
cuapi_cuEventSynchronize,
cuapi_cuEventDestroy_v2,
cuapi_cuEventElapsedTime,
cuapi_cuStreamWaitValue32,
cuapi_cuStreamWaitValue32_ptsz,
cuapi_cuStreamWriteValue32,
cuapi_cuStreamWriteValue32_ptsz,
cuapi_cuStreamWaitValue64,
cuapi_cuStreamWaitValue64_ptsz,
cuapi_cuStreamWriteValue64,
cuapi_cuStreamWriteValue64_ptsz,
cuapi_cuStreamBatchMemOp,
cuapi_cuStreamBatchMemOp_ptsz,
cuapi_cuStreamCreate,
cuapi_cuStreamCreateWithPriority,
cuapi_cuStreamGetPriority,
cuapi_cuStreamGetPriority_ptsz,
cuapi_cuStreamGetFlags,
cuapi_cuStreamGetCtx,
cuapi_cuStreamGetFlags_ptsz,
cuapi_cuStreamDestroy_v2,
cuapi_cuStreamWaitEvent,
cuapi_cuStreamWaitEvent_ptsz,
cuapi_cuStreamAddCallback,
cuapi_cuStreamAddCallback_ptsz,
cuapi_cuStreamSynchronize,
cuapi_cuStreamSynchronize_ptsz,
cuapi_cuStreamQuery,
cuapi_cuStreamQuery_ptsz,
cuapi_cuStreamAttachMemAsync,
cuapi_cuStreamAttachMemAsync_ptsz,
cuapi_cuDeviceCanAccessPeer,
cuapi_cuCtxEnablePeerAccess,
cuapi_cuCtxDisablePeerAccess,
cuapi_cuIpcGetEventHandle,
cuapi_cuIpcOpenEventHandle,
cuapi_cuIpcGetMemHandle,
cuapi_cuIpcOpenMemHandle,
cuapi_cuIpcCloseMemHandle,
cuapi_cuGLCtxCreate_v2,
cuapi_cuGLInit,
cuapi_cuGLGetDevices,
cuapi_cuGLRegisterBufferObject,
cuapi_cuGLMapBufferObject_v2,
cuapi_cuGLMapBufferObject_v2_ptds,
cuapi_cuGLMapBufferObjectAsync_v2,
cuapi_cuGLMapBufferObjectAsync_v2_ptsz,
cuapi_cuGLUnmapBufferObject,
cuapi_cuGLUnmapBufferObjectAsync,
cuapi_cuGLUnregisterBufferObject,
cuapi_cuGLSetBufferObjectMapFlags,
cuapi_cuGraphicsGLRegisterImage,
cuapi_cuGraphicsGLRegisterBuffer,
cuapi_cuGraphicsEGLRegisterImage,
cuapi_cuEGLStreamConsumerConnect,
cuapi_cuEGLStreamConsumerDisconnect,
cuapi_cuEGLStreamConsumerAcquireFrame,
cuapi_cuEGLStreamConsumerReleaseFrame,
cuapi_cuEGLStreamProducerConnect,
cuapi_cuEGLStreamProducerDisconnect,
cuapi_cuEGLStreamProducerPresentFrame,
cuapi_cuEGLStreamProducerReturnFrame,
cuapi_cuGraphicsResourceGetMappedEglFrame,
cuapi_cuEGLStreamConsumerConnectWithFlags,
cuapi_cuGraphicsUnregisterResource,
cuapi_cuGraphicsMapResources,
cuapi_cuGraphicsMapResources_ptsz,
cuapi_cuGraphicsUnmapResources,
cuapi_cuGraphicsUnmapResources_ptsz,
cuapi_cuGraphicsResourceSetMapFlags_v2,
cuapi_cuGraphicsSubResourceGetMappedArray,
cuapi_cuGraphicsResourceGetMappedMipmappedArray,
cuapi_cuGraphicsResourceGetMappedPointer_v2,
cuapi_cuProfilerInitialize,
cuapi_cuProfilerStart,
cuapi_cuProfilerStop,
cuapi_cuVDPAUGetDevice,
cuapi_cuVDPAUCtxCreate_v2,
cuapi_cuGraphicsVDPAURegisterVideoSurface,
cuapi_cuGraphicsVDPAURegisterOutputSurface,
cuapi_cuGetExportTable,
cuapi_cuOccupancyMaxActiveBlocksPerMultiprocessor,
cuapi_cuOccupancyMaxActiveBlocksPerMultiprocessorWithFlags,
cuapi_cuMemAdvise,
cuapi_cuMemPrefetchAsync,
cuapi_cuMemPrefetchAsync_ptsz,
cuapi_cuMemRangeGetAttribute,
cuapi_cuMemRangeGetAttributes,
cuapi_cuGetErrorString,
cuapi_cuGetErrorName,
cuapi_cuGraphCreate,
cuapi_cuGraphAddKernelNode,
cuapi_cuGraphKernelNodeGetParams,
cuapi_cuGraphKernelNodeSetParams,
cuapi_cuGraphAddMemcpyNode,
cuapi_cuGraphMemcpyNodeGetParams,
cuapi_cuGraphMemcpyNodeSetParams,
cuapi_cuGraphAddMemsetNode,
cuapi_cuGraphMemsetNodeGetParams,
cuapi_cuGraphMemsetNodeSetParams,
cuapi_cuGraphAddHostNode,
cuapi_cuGraphHostNodeGetParams,
cuapi_cuGraphHostNodeSetParams,
cuapi_cuGraphAddChildGraphNode,
cuapi_cuGraphChildGraphNodeGetGraph,
cuapi_cuGraphAddEmptyNode,
cuapi_cuGraphClone,
cuapi_cuGraphNodeFindInClone,
cuapi_cuGraphNodeGetType,
cuapi_cuGraphGetNodes,
cuapi_cuGraphGetRootNodes,
cuapi_cuGraphGetEdges,
cuapi_cuGraphNodeGetDependencies,
cuapi_cuGraphNodeGetDependentNodes,
cuapi_cuGraphAddDependencies,
cuapi_cuGraphRemoveDependencies,
cuapi_cuGraphDestroyNode,
cuapi_cuGraphInstantiate,
cuapi_cuGraphLaunch,
cuapi_cuGraphLaunch_ptsz,
cuapi_cuGraphExecDestroy,
cuapi_cuGraphDestroy,
cuapi_cuGraphDestroy_ptsz,
cuapi_cuStreamBeginCapture,
cuapi_cuStreamBeginCapture_ptsz,
cuapi_cuStreamBeginCapture_v2,
cuapi_cuStreamBeginCapture_v2_ptsz,
cuapi_cuStreamEndCapture,
cuapi_cuStreamEndCapture_ptsz,
cuapi_cuStreamIsCapturing,
cuapi_cuStreamIsCapturing_ptsz,
cuapi_cuStreamGetCaptureInfo,
cuapi_cuStreamGetCaptureInfo_ptsz,
cuapi_cuGraphExecKernelNodeSetParams,
cuapi_cuThreadExchangeStreamCaptureMode,
} cuapi_func_t;

#endif //_CULIBWRAP_H_
