import './App.css'
import { CodeView } from './components/CodeView/CodeView'
import { URL_CODE_EXAMPLE } from './config'

function App() {
  return (
    <>
      <CodeView codePanels={[ URL_CODE_EXAMPLE[0] ]} />
    </>
  )
}

export default App
