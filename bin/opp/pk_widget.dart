class PkWidget {
  String name;
  void enabele() {
    print('enable');
  }

  void disable() {
    print('disable');
  }
}

class PkTextWidget extends PkWidget {
  void renderingText() {
    print('rendering text');
  }
}

class PkTextButton extends PkWidget {
  void renderingButton(){
    print('rendering button');
  }
}
