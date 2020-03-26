---
title: "React"
date: 2020-03-24T00:15:36+02:00
draft: false
---

## props

props are immutable: they are passed from the parent and are “owned” by the parent. To implement interactions, we introduce mutable state to the component. this.state is private to the component and can be changed by calling this.setState(). When the state updates, the component re-renders itself. [https://linkedlist.org/react](https://linkedlist.org/react)

## Hooks

useState() returns/uses an array to destructure its return values. The reason it uses an array is that an object would require the destructuring to be done based on its property names - an array allows us to name the values whatever we want.
