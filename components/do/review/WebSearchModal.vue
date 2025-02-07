<script setup lang="ts">
import type { SearchParams } from './Card.vue'
const props = defineProps<{
  open: boolean
  searchParams: SearchParams
}>()

const emit = defineEmits<{
  'update:open': [value: boolean]
}>()

const openNewTab = (url: string) =>
  navigateTo(url, {
    external: true,
    open: {
      target: '_blank',
      windowFeatures: {
        noopener: true,
        noreferrer: true
      }
    }
  })

const searchViaBaidu = () =>
  openNewTab(
    `https://www.baidu.com/s?wd=${encodeURIComponent(
      props.searchParams.sentence
    )}`
  )

const searchViaGoogle = () =>
  openNewTab(
    `https://www.google.com/search?q=${encodeURIComponent(
      props.searchParams.sentence
    )}`
  )

const searchViaBing = () =>
  openNewTab(
    `https://cn.bing.com/search?q=${encodeURIComponent(
      props.searchParams.sentence
    )}`
  )

const searchViaDuckDuckGo = () =>
  openNewTab(
    `https://duckduckgo.com/?q=${encodeURIComponent(
      props.searchParams.sentence
    )}`
  )
</script>

<template>
  <a-modal
    title="使用搜索引擎确认句子"
    :open="open"
    wrap-class-name="search-modal"
    ok-text="好了"
    cancel-text="取消"
    @update:open="emit('update:open', $event)"
    @ok="emit('update:open', false)"
    @cancel="emit('update:open', false)"
  >
    <p>
      句子：<span class="font-noto-serif">{{
        props.searchParams.sentence
      }}</span>
    </p>
    <p><strong>单击下方的按钮以使用对应的搜索引擎进行搜索。</strong></p>
    <div class="search-buttons-group">
      <a-button @click="searchViaBaidu"> 百度 </a-button>
      <a-button @click="searchViaGoogle"> 谷歌 </a-button>
      <a-button @click="searchViaBing"> 必应 </a-button>
      <a-button @click="searchViaDuckDuckGo"> DuckDuckGo </a-button>
    </div>
  </a-modal>
</template>

<style lang="scss" scoped>
.search-buttons-group {
  @apply mt-3;

  .ant-btn {
    @apply mx-1 mb-2;
  }
}
</style>
