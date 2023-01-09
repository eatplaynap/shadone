import { mount, createLocalVue } from '@vue/test-utils'
import VModal from 'vue-js-modal/dist/index.nocss.js'
import VideoModal from '../../app/javascript/video-modal.vue'

describe('VideoModal', () => {
    const localVue = createLocalVue()
    localVue.use(VModal)
    const wrapper = mount(VideoModal, {
        localVue
    })

    it('opens a modal when clicked on How To Use button', async () => {
        expect(wrapper.find(`[data-testid="instruction-video-modal"]`).exists()).not.toBe(true)
        await wrapper.get(`[data-testid="how-to-use-button"]`).trigger('click')
        expect(wrapper.get(`[data-testid="instruction-video-modal"]`).exists()).toBe(true)
    })
    it('closes a modal when clicked on outside of iframe', async () => {
        await wrapper.get(`[data-testid="how-to-use-button"]`).trigger('click')
        const videoModalContainer = wrapper.get(`[data-testid="video-modal-container"]`).html()
        console.log(videoModalContainer)
        const outside = videoModalContainer.getElementById('app').closest(":not(iframe)")
        console.log(outside)
        await wrapper.get(`[data-testid="instruction-video-modal"]`).trigger('click')
        expect(wrapper.find(`[data-testid="instruction-video-modal"]`).exists()).not.toBe(true)


        // await wrapper.get(`[data-testid="how-to-use-button"]`).trigger('click')
        // const outSide = wrapper.get('iframe')
        // await wrapper.find(outSide).trigger('click')
        // expect(wrapper.find(`[data-testid="instruction-video-modal"]`).exists()).not.toBe(true)
    })
})
