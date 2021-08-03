abstract class PkWidget implements RenderingEngine {
  String name;
  void enabele() {
    print('enable');
  }

  void disable() {
    print('disable');
  }

  @override
  void render() {
    print('Render');
  }
}

class PkTextWidget extends PkWidget {
  @override
  void render() {
    print('Render text widget');
  }
}

class PkTextButton extends PkWidget {
  @override
  void render() {
    print('Render button widget');
  }
}

abstract class RenderingEngine {
  void render() {}
}
