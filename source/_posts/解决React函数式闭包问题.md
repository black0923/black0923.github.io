---
title: 解决React函数式闭包问题
date: 2022-08-30 16:22:31
tags: [React,Hook]
description: ' '
---

```tsx
import React, { useState, useEffect } from 'react';

export default () => {
  const [count, setCount] = useState(0);
  const log = () => {
    setTimeout(() => {
      console.log('count:', count);
    }, 3000);
  };
  return (
    <div>
      count: {count}
      <br />
      <button onClick={() => setCount((val) => val + 1)}>增加 1</button>
      <br />
      <button onClick={log}>log</button>
    </div>
  );
};
```

## 问题

```text
当我们点击log打印，并在3s内更新count值，发现setTimeout后执行打印出的count依旧是3s前的值
```

## 使用useRef解决

```tsx
import React, { useState, useEffect, useRef } from 'react';

export default () => {
  const [count, setCount] = useState(0);
  const ref = useRef();
  ref.current = count;
  const log = () => {
    setTimeout(() => {
      console.log('count:', ref.current);
    }, 3000);
  };
  return (
    <div>
      count: {count}
      <br />
      <button onClick={() => setCount((val) => val + 1)}>增加 1</button>
      <br />
      <button onClick={log}>log</button>
    </div>
  );
};
```

```text
3s内更新count 也会在setTimeout后执行log方法时拿到当前最新的值
```
