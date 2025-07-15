# 🧪 Karate API Tests – Portafolio QA

Este repositorio contiene un conjunto de pruebas automatizadas de API utilizando [Karate DSL](https://github.com/karatelabs/karate), como parte de mi formación y experiencia como **QA Automation Engineer**.

> 🔍 Este proyecto forma parte de mi portafolio profesional y está orientado a demostrar el uso práctico de pruebas `GET`, `POST`, `PUT`, `DELETE`, validación de estructuras JSON, manejo de datos externos y reportes HTML de ejecución.

---

## 📦 Tecnologías utilizadas

- ✅ [Karate DSL](https://github.com/karatelabs/karate)
- ✅ Maven
- ✅ JUnit5
- ✅ IntelliJ IDEA
- ✅ GitHub Actions (próximamente)
- ✅ JSON Placeholder como API simulada

---

## 📁 Estructura del proyecto
```text
karate-api-tests/
├── src/test/java/examples/
│   ├── primerTest.feature         # Escenarios de prueba principales
│   ├── users/users.feature        # (Opcional) Casos separados por módulo
│   ├── data/nuevo-post.json       # JSON externo reutilizable
│   └── ExamplesTest.java          # Runner para ejecución con JUnit5
├── karate-config.js               # Configuración global (por entorno)
├── logback-test.xml               # Configuración de logs
├── pom.xml                        # Configuración de Maven
└── README.md                      # Este archivo
```


---

## 🧪 Escenarios implementados

### ✔️ CRUD básico sobre `/posts`
- `GET /posts/{id}` → Obtener usuario
- `POST /posts` → Crear post inline y desde archivo externo
- `PUT /posts/{id}` → Actualizar post existente
- `DELETE /posts/{id}` → Eliminar post simulado

### ✔️ Validaciones y prácticas
- Uso de `Background` para eliminar repetición de código
- Uso de `Scenario Outline` para pruebas con múltiples datos
- Validaciones con `match`, `match contains`, `match each`
- Generación de reportes HTML post-ejecución

---

## ▶️ Cómo ejecutar las pruebas

Asegúrate de tener Maven instalado. Luego ejecuta:

```bash
mvn test
```

## 📸 Evidencia de ejecución

Después de ejecutar `mvn test`, se genera un reporte HTML:

📍 Ubicación: `target/karate-reports/karate-summary.html`

### 🟢 Reporte generado por Karate DSL:

![Reporte de ejecución](./screenshots/reporteEjecucion.png)

## 🤝 Cómo contribuir

1. Haz un fork del proyecto
2. Crea tu rama: `git checkout -b mi-feature`
3. Haz commit de tus cambios: `git commit -m 'Agrego nueva validación'`
4. Sube tu rama: `git push origin mi-feature`
5. Abre un Pull Request
---
También puedes abrir issues si detectas errores o mejoras.

## 👨‍💻 Autor

**Elohim Aguilar**  
QA Lead | Automatización de APIs | Testing de microservicios  
📫 [LinkedIn](https://linkedin.com/in/TU_USUARIO)  
💻 [GitHub](https://github.com/TU_USUARIO)

> “Automatizar no es solo ejecutar rápido, es validar con inteligencia.” 🧠

## 📄 Licencia

Este proyecto es de uso libre para fines educativos y de portafolio profesional.  
No contiene datos privados ni APIs propietarias.

