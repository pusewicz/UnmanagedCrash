import CPicoECS

protocol System: AnyObject {
  func update()
}

class Position: System {
  var x: Int = 0
  var y: Int = 0

  func update() {
    print("Position(x: \(x), y: \(y))")
  }
}

/// Register a system with the ECS using a template function.
func registerSystem<T: System>(ecs: OpaquePointer, system: T) {
  let systemPointer = Unmanaged.passUnretained(system).toOpaque()

  ecs_register_system(
    ecs,
    { (ecs, entities, count, deltaTime, userData) in
      print("System update called with count: \(count), deltaTime: \(deltaTime)")

      let system = Unmanaged<T>.fromOpaque(userData!).takeUnretainedValue()  // FIX: Crash!
      system.update()
      return 0
    },
    nil,
    nil,
    systemPointer
  )
}

guard let ecs = ecs_new(1024, nil) else {
  fatalError("Failed to create ECS instance")
}

registerSystem(ecs: ecs, system: Position())
ecs_update_systems(ecs, 0.016)  // Simulate a frame update
