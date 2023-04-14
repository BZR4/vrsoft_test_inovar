class TextoUtils {
  static String getIniciais(String texto) {
    return texto
        .replaceAll(' de ', ' ')
        .replaceAll(' da ', ' ')
        .replaceAll(' para ', ' ')
        .split(' ')
        .map((e) => e[0].toUpperCase())
        .toList()
        .join();
  }
}
