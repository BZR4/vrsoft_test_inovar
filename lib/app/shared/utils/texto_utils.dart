class TextoUtils {
  static String getIniciais(String texto) {
    return texto
        .trim()
        .split(' ')
        .map((e) => e[0].toUpperCase())
        .toList()
        .join();
  }
}
