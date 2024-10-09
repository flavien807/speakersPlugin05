# speakers--mode-plugin

Plugin pour basculer entre le mode haut-parleur et écouteur.

## Install

```bash
npm install speakers--mode-plugin
npx cap sync
```

## API

<docgen-index>

* [`setAudioMode(...)`](#setAudioMode)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### setAudioMode(...)

```typescript
setAudioMode(options: { mode: 'speaker' | 'earpiece' }) => Promise<{ success: boolean; }>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ mode: 'speaker' | 'earpiece' }</code> |

**Returns:** <code>Promise&lt;{ mode: 'speaker' | 'earpiece' }&gt;</code>

--------------------

</docgen-api>
