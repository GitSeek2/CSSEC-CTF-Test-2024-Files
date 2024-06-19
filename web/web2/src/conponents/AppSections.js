import AppSectionsList from './AppSectionsList.js';
import AppSectionsForm from './AppSectionsForm.js';

export default {
    components: { AppSectionsList, AppSectionsForm },
    template: `
      <app-sections-list
          headline="未完成"
          :doChild="filters.beforeDo">
      </app-sections-list>
      <app-sections-list
          headline="已完成"
          :doChild="filters.afterDo">
      </app-sections-list>
      <app-sections-form
          @add="fatherAdd">
      </app-sections-form>
    `,
    // 初始化数据
    data() {
        return {
            todos: JSON.parse(localStorage.getItem('todos')) || [
                { id: 1, name: '吃饭', done: false },
                { id: 2, name: '睡觉', done: false },
                { id: 3, name: '打 CTF', done: false }
            ],
        }
    },
    computed: {
        filters() {
            return {
                beforeDo: this.todos.filter(item => !item.done),
                afterDo: this.todos.filter(item => item.done)
            }
        }
    },
    methods: {
        fatherAdd(todo) {
            this.todos.push({
                id: this.todos.length + 1,
                name: todo,
                done: false
            });
            this.saveTodos();
        },
        saveTodos() {
            localStorage.setItem('todos', JSON.stringify(this.todos));
        }
    },
    watch: {
        todos: {
            handler() {
                this.saveTodos();
            },
            deep: true
        }
    }
}