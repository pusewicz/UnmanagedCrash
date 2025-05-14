protocol System: AnyObject {
  func update()
}

typealias SystemCallback = @convention(c) (
  UnsafeMutableRawPointer?
) -> Int32

@discardableResult
func ecsRegisterSystem(
  _ callback: @escaping SystemCallback,
  _ udata: UnsafeMutableRawPointer?
) -> Int32 {
  return 0
}

func registerSystem<T: System>(ecs: OpaquePointer, system: T, type: T.Type = T.self) {
  let systemPointer = Unmanaged<T>.passUnretained(system).toOpaque()

  ecsRegisterSystem(
    { (userData) in
      let system = Unmanaged<T>.fromOpaque(userData!).takeUnretainedValue()  // FIX: Crash!
      system.update()
      return 0
    },
    systemPointer
  )
}
