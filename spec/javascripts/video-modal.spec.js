import { mount, createLocalVue } from '@vue/test-utils'
import VModal from 'vue-js-modal/dist/index.nocss.js'
import VideoModal from '../../app/javascript/video-modal.vue'

describe('VideoModal', () => {
    let wrapper
    beforeEach(() => {
        const localVue = createLocalVue()
        localVue.use(VModal)
        wrapper = mount(VideoModal, {
            localVue
        })
    })

    it('opens a modal when clicked on How To Use button', async () => {
        expect(wrapper.find(`[data-testid="instruction-video-modal"]`).exists()).not.toBe(true)
        await wrapper.get(`[data-testid="how-to-use-button"]`).trigger('click')
        expect(wrapper.get(`[data-testid="instruction-video-modal"]`).exists()).toBe(true)
    })
    it('closes a modal when clicked on outside of iframe', async () => {
        // click on How To Use button
        // ensures that the modal is open
        // click on outside of iframe
    })
})
