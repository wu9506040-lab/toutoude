import { defineConfig } from 'vite'

export default defineConfig({
  base: '/',
  server: {
    port: 3000,
    open: true,
    headers: {
      // 对.glb大文件启用长期缓存
      'Cache-Control': 'public, max-age=31536000',
      // 禁止JS/CSS缓存，确保开发时代码实时更新
      'Surrogate-Control': 'no-store',
      'Pragma': 'no-cache',
    },
    // 增大body限制，避免大文件请求被拒绝
    fs: {
      allow: ['.']
    }
  },
  build: {
    outDir: 'dist',
    assetsDir: 'assets'
  }
})
