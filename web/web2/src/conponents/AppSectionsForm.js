export default {
    template: `
      <form @submit.prevent="add">
        <input type="text" placeholder="添加任务" v-model="newTodo">
        <button type="submit">添加</button>
      </form>
    `,
    data() {
        return {
            newTodo: ''
        }
    },
    methods: {
        add() {
            if (!this.newTodo.trim()) {
                return;
            }
            this.$emit('add', this.newTodo);
            this.newTodo = '';
        }
    }
}