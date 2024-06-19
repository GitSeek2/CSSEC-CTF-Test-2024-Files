export default {
  template: `
      <section v-show="doChild.length">
        <h2>{{ headline }}</h2>
        <ul>
          <li v-for="todo in doChild" :key="todo.id">
            <label>
              <input type="checkbox" v-model="todo.done">
              <span>{{ todo.name }}</span>
            </label>
          </li>
        </ul>
      </section>
    `,
  props: {
    headline: String,
    doChild: Array
  }
}