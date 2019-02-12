import babel from 'rollup-plugin-babel';
import { dependencies } from './package.json';

export default {
  input: './src/index.ts',
  output: {
    file: './dist/server.js',
    format: 'cjs',
  },
  plugins: [babel()],
  external: [...Object.keys(dependencies)],
};
