import { useEffect, type FC } from "react";
import type { CodeExample } from "../../config";
import styles from './CodeView.module.css'

type Props = { codePanels: CodeExample[]; }

/** Use for storing remote loaded values */
const codeValueCacheMap = new Map<CodeExample['name'], string>();

export const CodeView: FC<Props> = ({ codePanels }) => {
  useEffect(() => {
    codePanels.forEach(async (panel) => {
      if (codeValueCacheMap.has(panel.name)) return;
      const result = await fetch(panel.url)
      if (!result.ok) throw new Error('Failed to load code example value!');
      const value = await result.text();
      codeValueCacheMap.set(panel.name, value);
    });
  }, [codePanels]);

  return <div className={styles.container}>
    {Object.entries(codeValueCacheMap).map(([name, value]) => <div className={styles.code}>{value}</div>)}
  </div>
}
