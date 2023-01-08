import { shallowMount,mount, createLocalVue } from '@vue/test-utils'
import VModal from 'vue-js-modal/dist/index.nocss.js'
import VideoModal from '../../app/javascript/video-modal.vue'

describe('VideoModal', () => {
    it('opens a modal when clicked on How To Use button', async () => {
        const localVue = createLocalVue()
        localVue.use(VModal)
        const wrapper = mount(VideoModal, {
            localVue
        })
        expect(wrapper.find(`[data-testid="instruction-video-modal"]`).exists()).not.toBe(true)
        await wrapper.get(`[data-testid="how-to-use-button"]`).trigger('click')
        expect(wrapper.get(`[data-testid="instruction-video-modal"]`).exists()).toBe(true)
    })
    it('closes a modal', () => {

    })
})
