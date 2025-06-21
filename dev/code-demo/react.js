import { useState, Component } from "react";

class ClassComponent extends Component {
  render() {
    return (
      <div className="wow">
        <input type="number" />
      </div>
    );
  }
}

export const FunctionalComponent = () => {
  const [count, setCount] = useState(0);

  return (
    <div className="wow">
      <input type="number" />
    </div>
  )
}
